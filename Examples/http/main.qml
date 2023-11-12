import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Label {
        id: answer
    }

    Flickable {
        id: flickable
        anchors.bottom: parent.bottom
        anchors.top: answer.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 320
        ListView {
            id: view
            anchors.fill: parent
            delegate: Image {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 150
                height: 150
                source: modelData.thumbnailUrl
            }
        }

        function requestPhotos() {
            var xhr = new XMLHttpRequest();
            xhr.responseType = 'json';
            xhr.onreadystatechange = function() {
                // if (xhr.readyState === XMLHttpRequest.DONE) {
                    print(xhr.readyState)
                    var json = JSON.parse(xhr.responseText)
                    view.model = json;
                    print(json[0].title)
                // }
            }
            xhr.open("GET", "https://jsonplaceholder.typicode.com/photos");
            xhr.send();
        }
        function requestUser() {
            var xhr = new XMLHttpRequest();
            xhr.responseType = 'json';
            xhr.onreadystatechange = function() {
                print(xhr.readyState)
                var json = JSON.parse(xhr.responseText)
                answer.text = "id = %1, timestamp %2".arg(json.id).arg(json.createdAt);
                print(xhr.response)
            }
            xhr.open("POST", "https://reqres.in/api/users");
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            var body = 'name=' + encodeURIComponent("morpheus") +
              '&job=' + encodeURIComponent("leader");
            xhr.send(body);
        }

        Component.onCompleted: {
            requestPhotos();
            requestUser();
        }
    }
}
