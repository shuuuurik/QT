import QtQuick
import QtQuick.Window

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rectangle
        width: 400; height: 400
        color: "black"
        anchors.centerIn: parent

        MouseArea {
            id: mouseArea;
            anchors.fill:parent;
            //onClicked: rectangle.state = "rotated"
            onPressed: {rectangle.rotation = 45; rectangle.width = 200}
            onReleased: {rectangle.rotation = 0; rectangle.width = 400}
        }

        Behavior on rotation {
            RotationAnimation { duration: 1000 }
        }
        Behavior on width {
            NumberAnimation { duration: 1000 }
        }

        /*states: State {
            name: "rotated"; when: mouseArea.pressed
            PropertyChanges {
                target: rectangle
                rotation: 45
                width: 200
                //transform: [
                    //Scale { yScale: 0.5 },
                    //Rotation {
                         //axis.x: 1; axis.y: 1; axis.z: -1
                         //angle: 45
                    //}
                //]
            }
        }

        transitions: Transition {
            from: "rotated"; to: "rotated"
            //RotationAnimation { duration: 2000 }
            NumberAnimation { duration: 2000 }

            //NumberAnimation { properties: "rotation,width"; easing.type: Easing.InOutQuad }
        }*/
    }
}
