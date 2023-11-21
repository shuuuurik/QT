import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Rectangle {
        width: 320; height: 480

        WorkerScript {
            id: myWorker
            source: "workerscript.js"

            onMessage: {
                if (messageObject.row == rowSpinner.currentIndex + 1 && messageObject.column == columnSpinner.currentIndex + 1){ //Not an old result
                    if (messageObject.result == -1)
                        resultText.text = "Column must be <= Row";
                    else
                        resultText.text = messageObject.result;
                }
            }
        }
        Row {
            y: 24
            spacing: 24
            anchors.horizontalCenter: parent.horizontalCenter
            Tumbler {
                id: rowSpinner
                model: 64
                onCurrentIndexChanged: {
                    resultText.text = "Loading...";
                    myWorker.sendMessage( { row: rowSpinner.currentIndex + 1, column: columnSpinner.currentIndex +1 } );
                }
            }

            Tumbler {
                id: columnSpinner
                model: 64
                onCurrentIndexChanged: {
                    resultText.text = "Loading...";
                    myWorker.sendMessage( { row: rowSpinner.currentIndex + 1, column: columnSpinner.currentIndex + 1 } );
                }
            }
        }

        Text {
            id: resultText
            y: 180
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 32
        }

        Text {
            text: "Pascal's Triangle Calculator"
            anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom; bottomMargin: 50 }
        }
    }
}
