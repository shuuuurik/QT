import QtQuick
import QtQuick.Window
import myModule 1.0
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 250
    height: 120
    title: qsTr("Счётчик")

    MyCounterClass {
        id: myCounterClass
        // counterProperty: 0
    }
    
    Column {
        anchors.fill: parent
        spacing: 10

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: myCounterClass.counterProperty
            font.pixelSize: 32
        }

        Button {
            id: increment
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Прибавить 1"
            onClicked: {
                myCounterClass.inc()
            }
        }
        Button {
            id: tozero
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Сбросить"
            onClicked: {
                myCounterClass.zero()
            }
        }
    }
}
