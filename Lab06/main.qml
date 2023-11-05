import QtQuick
import QtQuick.Window
import QtQuick.LocalStorage
import QtQuick.Controls
import "Database.js" as JS

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("Продукты")

    Column {
        id: column
        anchors.fill: parent
        Label {
            id: totalCostLabel
            //anchors.horizontalCenter: parent.horizontalCenter
            text: 'Total cost: '
            font { pointSize: 20; bold: true }
        }
        ListView {
            id: listView
            spacing: 10
            width: parent.width
            height: parent.height - addButton.height - totalCostLabel.height - 100
            anchors.top: totalCostLabel.bottom
            model: ListModel { 
                id: productModel
                onCountChanged: {
                    totalCostLabel.text = 'Total cost: ' + JS.dbSumPrice()
                }
            }
            delegate: Rectangle {
                width: parent.width / 2; height: 70; color: "blue"
                anchors.horizontalCenter: parent.horizontalCenter
                border { color: "black"; width: 5 }
                Text {
                    anchors.centerIn: parent
                    text: id + ' ' + name + ' ' + price
                    font.pointSize: 16
                    color: "yellow"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        JS.dbDelete(productModel.get(model.index).id)
                        productModel.remove(model.index, 1)
                        //totalCostLabel.text = 'Total cost: ' + JS.dbSumPrice()
                    }
                }
            }
        }

        Rectangle {
            id: addButton
            width: 200; height: 100
            color: "green"
            radius: 20
            anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom }
            Text {
                text: "Add item"
                anchors.centerIn: parent
                font { pointSize: 20; bold: true }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var component = Qt.createComponent("ProductDialog.qml");
                    var productDialog = component.createObject(column, {/*x: 300, y: 300*/});
                    productDialog.anchors.centerIn = column
                    /*productDialog.anchors.horizontalCenter = parent.horizontalCenter
                    productDialog.anchors.bottom = column.bottom*/
                    productDialog.open()
                    productDialog.accepted.connect(function() {
                        if (!parseInt(productDialog.price)){
                            console.log("Price must be integer")
                            return
                        }
                        JS.dbInsert(productDialog.name, parseInt(productDialog.price))
                        productModel.clear()
                        JS.dbReadAll()
                        //productModel.append({"name": productDialog.name, "price": productDialog.price })
                        productDialog.destroy()
                        //totalCostLabel.text = 'Total cost: ' + JS.dbSumPrice()
                    });
                }
            }
        }
        Component.onCompleted: {
            JS.dbInit()
            //JS.dbDropTable()
            JS.dbReadAll()
        }
    }
}