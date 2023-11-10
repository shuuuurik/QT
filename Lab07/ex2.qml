import QtQuick
import QtQuick.Window
import QtQuick.Controls
import myModule 1.0

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("StringList")
    
    MyListStringClass {
        id: myListStringClass
        // onListChanged: label.text = myListStringClass.list_to_str()
    }

    Column {
        id: col
        anchors.fill: parent
        spacing: 5

        Label {
            id: label
            width: parent.width
            height: 30 
            text: myListStringClass.strFromListProperty
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }

        TextField {
            id: stringToSave
            width: parent.width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            placeholderText: "Введите строку"
            validator: RegularExpressionValidator { regularExpression: /[a-zA-Zа-яА-Я][ a-zA-Zа-яА-Я]+/ }
        }

        Button {
            text: qsTr("Добавить элемент")
            width: parent.width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            onClicked: {
                myListStringClass.add_to_list(stringToSave.text)
            }
        }

        Button {
            text: qsTr("Удалить последний элемент списка")
            width: parent.width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            onClicked: {
                myListStringClass.pop_from_list()
            }
        }
    }
}
