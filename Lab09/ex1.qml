import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 400
    height: 250
    title: qsTr("WorkerScript")

    WorkerScript {
        id: myWorker
        source: "script.js"
        onMessage: {
            labelError.visible = false
            label.text = 'Результат: ' + messageObject.result
        }
    } 

    Column {
        anchors.fill: parent
        anchors.topMargin: 20
        spacing: 5

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            text: 'Результат:'
        }
        
        TextField {
            id: num
            width: parent.width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            placeholderText: "Введите n (в диапазоне от 1 до 30)"
            validator: IntValidator { bottom: 1; top: 30 }
        }

        Button {
            width: 100
            height: 30
            text: "Ввести"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var number = parseInt(num.text);
                if (number <= 0 || number > 30){
                    labelError.visible = true
                    return;
                } 
                myWorker.sendMessage({ 'n': parseInt(num.text)})
            }
        }

        Label {
            id: labelError
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            color: "red"
            text: "Неверный ввод!"
            visible: false
        }
    }
}
