import QtQuick
import QtQuick.Window

Window {
    width: 1000
    height: 800
    visible: true
    title: qsTr("Animation")
    MouseArea { id: mouseArea; anchors.fill:parent; onClicked: seqanim.start() }
    Rectangle{
        x: 100; y: 100
        id: rect
        color: "yellow"
        width: 200; height: 200
        radius: width / 2
        SequentialAnimation {
            //running: true
            //loops : 10
            id: seqanim
            NumberAnimation { target: rect; property: "x";
                to: 500; duration: 1000 }
            NumberAnimation { target: rect; property: "y";
                to: 500; duration: 1000 }
            NumberAnimation { target: rect; property: "x";
                to: 100; duration: 1000 }
            NumberAnimation { target: rect; property: "y";
                to: 100; duration: 1000 }
        }
    }
}
