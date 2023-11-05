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
    title: qsTr("Заметки")

    /*NoteDialog {
        id: noteDialog
    }*/

    Column {
        anchors.fill: parent
        ListView {
            id: listView
            width: parent.width
            height: parent.height - button.height
            model: ListModel { id: noteModel }
            delegate: Label {
                text: date + ' ' + note
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Button {
            id: button
            text: qsTr("Добавить")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var component = Qt.createComponent("NoteDialog.qml");
                var noteDialog = component.createObject(window, {x: 100, y: 100});
                noteDialog.open()
                noteDialog.accepted.connect(function() {
                    JS.dbInsert(noteDialog.date, noteDialog.note)
                    noteModel.append({"date": noteDialog.date, "note": noteDialog.note })
                    noteDialog.destroy()
                });
            }
        }
        Component.onCompleted: {
            JS.dbInit()
            JS.dbReadAll()
        }
    }
}
