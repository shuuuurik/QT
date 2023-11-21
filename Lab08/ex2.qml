import QtQuick 2.0
import QtQuick.Window
import QtQuick.Controls

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("HTTP POST request")
    Column {
        id: col
        anchors.centerIn: parent
        width: parent.width
        spacing: 5

        TextField {
            id: login
            width: parent.width / 2
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Введите логин"
            font.pointSize: 13
        }

        TextField {
            id: password
            width: parent.width / 2
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Введите пароль"
            font.pointSize: 13
        }

        Button {
            id: button
            text: qsTr("Добавить")
            font.pointSize: 13
            width: 100
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                appendDataJSON()
            }
        }

        Label {
            id: label
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            height: 30
            text: ""
            font.pointSize: 13
        }
    }

    function appendDataJSON() {
        var xhr = new XMLHttpRequest();
        xhr.responseType = 'json';
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var json = JSON.parse(xhr.responseText)
                if (xhr.status && xhr.status === 200) {
                    label.text = "Токен ответа: " + json.token
                    print(xhr.responseText)
                } else {
                    label.text = "Ошибка: " + json.error
                    console.log("HTTP:", xhr.status, xhr.statusText)
                }
            }
        }
        xhr.open("POST", "https://reqres.in/api/register");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        var body = 'email=' + login.text +
        '&password=' + password.text;
        xhr.send(body);
    }
}