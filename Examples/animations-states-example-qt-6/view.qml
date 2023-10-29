import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column {
        anchors.fill: parent
        spacing: 20

        Image {
            id: image
            source: "assets/background.png"
            width: parent.width

            property int padding: 40
            property int duration: 400
            property bool running: false

            Image {
                id: box
                x: image.padding;
                y: (image.height-height)/2
                source: "assets/box_green.png"

                NumberAnimation on x {
                    to: image.width - box.width - image.padding
                    duration: image.duration
                    running: image.running
                }
                RotationAnimation on rotation {
                    to: 360
                    duration: image.duration
                    running: image.running
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: image.running = true
            }

        }

        Rectangle {
            id: trafficLight
            width: 150
            height: 250
            anchors.horizontalCenter: parent.horizontalCenter

            property color black: '#1f1f21'
            property color red: '#fc3d39'
            property color green: '#53d769'


            gradient: Gradient {
                GradientStop { position: 0.0; color: "#2ed5fa" }
                GradientStop { position: 1.0; color: "#2467ec" }
            }

            Rectangle {
                id: light1
                x: 25; y: 15
                width: 100; height: width
                radius: width/2
                color: trafficLight.black
                border.color: Qt.lighter(color, 1.1)
            }

            Rectangle {
                id: light2
                x: 25; y: 135
                width: 100; height: width
                radius: width/2
                color: trafficLight.black
                border.color: Qt.lighter(color, 1.1)
            }

            state: "stop"

            states: [
                State {
                    name: "stop"
                    PropertyChanges { target: light1; color: trafficLight.red }
                    PropertyChanges { target: light2; color: trafficLight.black }
                },
                State {
                    name: "go"
                    PropertyChanges { target: light1; color: trafficLight.black }
                    PropertyChanges { target: light2; color: trafficLight.green }
                }
            ]
            MouseArea {
                anchors.fill: parent
                onClicked: parent.state = (parent.state == "stop"? "go" : "stop")
            }
            transitions: [
                Transition {
                    from: "stop"; to: "go"
                    //            from: "*"; to: "*"
                    ColorAnimation { target: light1; properties: "color"; duration: 2000 }
                    ColorAnimation { target: light2; properties: "color"; duration: 2000 }
                }
            ]

        }
    }
}
