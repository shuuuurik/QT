import QtQuick
import QtQuick.Window

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: redRect
        color: "red"
        width: 200; height: 200
    }
    Rectangle{
        id: greenRect
        color: "green"
        width: 200; height: 200
        anchors {
            left: redRect.right
            verticalCenter: redRect.bottom
        }
    }
    Rectangle{
        color: "blue"
        width: 200; height: 200
        anchors.horizontalCenter: greenRect.right
        Text{
            text: "Квадрат"
            //width: parent.width
            color: "white"
            font { pointSize: 24; bold: true }
            anchors.centerIn: parent
        }
    }
}
