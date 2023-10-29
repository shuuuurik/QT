import QtQuick
import QtQuick.Controls

Dialog {
    title: "Dialog"
    standardButtons: Dialog.Ok | Dialog.Cancel

    TextField {
        id: nameField
        anchors.centerIn: parent
        width: parent.width
        placeholderText: qsTr("Enter text")
        text: ""
    }
}
