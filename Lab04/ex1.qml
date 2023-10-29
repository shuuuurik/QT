import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Button")

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent
        Label {
            id: label
            text: qsTr("Button released")
            font.pointSize: 14
        }
        Button {
            // anchors.horizontalCenter: parent.horizontalCenter
            text: "Click"
            onPressed: label.text = "Button pressed"
            onReleased: label.text = "Button released"
        }
    }
}