import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Button")

    Column {
        anchors.fill: parent
        spacing: 20
        Label {
            id: label
            width: parent.width
            text: qsTr("Dialog example")
        }
        SimpleDialog {id: dialog; title: "New dialog"; height: 200 }
        Button {
            text: qsTr("Open dialog")
            onClicked: {
                dialog.open();
                dialog.accepted.connect(function() {
                    if (parseInt(dialog.firstNum) && parseInt(dialog.secondNum)){
                        console.log(parseInt(dialog.firstNum) + parseInt(dialog.secondNum))
                    }
                    else {
                        console.log("The entered strings must be a numbers")
                    }
                });
            }
        }
    }
}