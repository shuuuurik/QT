import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Column {
        anchors.fill: parent; spacing: 20

        Text {
            text: "If a translation is available for the system language (eg. Russian) then the "+
            "string below will translated (eg. 'Привет'). Otherwise it will show 'Hello'."
            width: parent.width; wrapMode: Text.WordWrap
        }

        Text {
            text: qsTr("Hello")
            font.pointSize: 25; anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Component.onCompleted: console.log(JSON.stringify(Qt.locale()))
}
