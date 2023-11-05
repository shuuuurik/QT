function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Note_DB", "", "Notes", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS note_table (date text,note text)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("Note_DB", "",
                                               "Notes", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(Pdate, Pdesc)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO note_table VALUES(?, ?)',
                      [Pdate, Pdesc])
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
                    'SELECT rowid,date,note FROM note_table order by rowid desc')
        for (var i = 0; i < results.rows.length; i++) {
            noteModel.append({
                                 date: results.rows.item(i).date,
                                 note: results.rows.item(i).note
                             })
        }
    })
}
