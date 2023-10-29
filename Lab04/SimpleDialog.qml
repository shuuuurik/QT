import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.3

Dialog {
    title: "Dialog"
    standardButtons: Dialog.Ok | Dialog.Cancel
    height: parent.height / 3; width:  parent.width / 3
    property alias firstNum: firstField.text
    property alias secondNum: secondField.text

    ColumnLayout {
        anchors.fill: parent
        TextField {
            id: firstField
            width: parent.width
            placeholderText: qsTr("Enter fitst number")
            text: ""
        }
        TextField {
            id: secondField
            width: parent.width
            placeholderText: qsTr("Enter second number")
            text: ""
        }
    }
}
