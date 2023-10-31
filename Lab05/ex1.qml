import QtQuick 2.9
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: qsTr("Menu")

    /*MenuBar {
        width: parent.width
        Menu {
            title: qsTr("Items")
            id: bar
            Action { text: qsTr("Item1") }
            Action { text: qsTr("Item2") }
        }
    }

    StackLayout {
        height: parent.height - bar.height
        width: parent.width
        anchors.top: bar.bottom
        currentIndex: (bar.currentIndex !== -1) ? bar.currentIndex : 3
        Label {
            text: qsTr("Item1 text")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            //anchors.centerIn: parent
        }
        Label {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            //anchors.centerIn: parent
            text: qsTr("Item2 text")
        }
    }*/
    MenuBar {
        width: parent.width
        id: bar
        Menu {
            title: qsTr("Items")
            MenuItem { text: "Item1"; onTriggered: label.text = text }
            MenuItem { text: "Item2"; onTriggered: label.text = text }
            MenuItem { text: "Item3"; onTriggered: label.text = text }
        }
    }
    Button {
        /*width: 150
        height: 100 */
        text: "Clear"
        anchors.top: bar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: label.text = ""
    }
    Label {
        anchors.centerIn: parent
        id: label
        text: ""
    }
}  