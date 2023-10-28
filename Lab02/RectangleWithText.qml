import QtQuick 2.0

Rectangle {
    id: rectangle
    property alias rectangleName: text.text
    property alias rectangleColor: rectangle.color
    property alias textColor: text.color
    height: 120
    color: "white"
    width: parent.width //200
    Text {
        id: text
        color: "black"
        anchors.centerIn: parent
        font { pointSize: 20; bold: true }
    }
}