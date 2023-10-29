import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Button")

    ButtonGroup { 
        id: radioButtonsGroup 
        //onClicked: label.text = "Нажата "+ button.id
    }
    Label {
        id: label
        y:100;
        anchors.horizontalCenter: parent.horizontalCenter
        text: radioButtonsGroup.checkedButton.text + " button is selected"
        font.pointSize: 14
    }
    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent
        RadioButton {
            id: button1
            //text: checked ? qsTr("Active") : qsTr("Inactive")
            text: "First" 
            ButtonGroup.group: radioButtonsGroup
        }
        RadioButton {
            id: button2
            //text: checked ? qsTr("Active") : qsTr("Inactive")
            text: "Second" 
            ButtonGroup.group: radioButtonsGroup
        }
        RadioButton {
            id: button3
            //text: checked ? qsTr("Active") : qsTr("Inactive")
            text: "Third" 
            ButtonGroup.group: radioButtonsGroup
        }
    }
}