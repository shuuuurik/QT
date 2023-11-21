import QtQuick 2.0
import QtQuick.Window

Window {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("HTTP GET request")

    ListModel {
        id: dataModel
    }

    ListView {
        id: view
        anchors.fill: parent
        spacing: 5
        model: dataModel
        delegate: Rectangle {
            width: parent.width - 10
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            color: "skyblue"
            Text {
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
                font.pointSize: 14
                text: `${model.userID}: (${model.id}) ${model.title} (${model.comleted})`
            }
            border { color: "black"; width: 5 }
        }
    }

    Component.onCompleted: {
        getDataJSON()
    }

    function getDataJSON() {
        var request = new XMLHttpRequest()
        request.open('GET', 'https://jsonplaceholder.typicode.com/todos', true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    for (var item of result){
                        dataModel.append({
                            "userID": item.userId,
                            "id": item.id,
                            "title": item.title,
                            "comleted": item.completed
                        })
                    }
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
    }
}
