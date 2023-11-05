function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Product_DB", "", "Products", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS product (id INTEGER PRIMARY KEY AUTOINCREMENT, name text, price bigint)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("Product_DB", "",
                                               "Products", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(Pname, Pprice)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO product (name, price) VALUES(?, ?);',
                      [Pname, Pprice])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}

function dbReadAll()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,id,name,price FROM product order by id;')
        for (var i = 0; i < results.rows.length; i++) {
            productModel.append({
                id: results.rows.item(i).id,
                name: results.rows.item(i).name,
                price: results.rows.item(i).price
            })
        }
    })
}

function dbDropTable()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('Drop Table product')
    });
}

function dbDelete(id)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('DELETE FROM product WHERE id = ?;', id)
    });
}

function dbSumPrice()
{
    var db = dbGetHandle()
    var sum = 0
    db.transaction(function (tx) {
        var result = tx.executeSql('SELECT sum(price) as sum FROM product;')
        sum = result.rows.item(0).sum
    });
    return sum;
}