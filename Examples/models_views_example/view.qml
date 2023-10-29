import QtQuick 2.9
import QtQuick.Controls 2.2


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    Grid {
        id: container
        spacing: 2
        anchors.fill: parent
        columns: 2
        Repeater {
            model: ListModel {
                ListElement { name: "Меркурий"; surfaceColor: "gray" }
                ListElement { name: "Венера"; surfaceColor: "yellow" }
                ListElement { name: "Земля"; surfaceColor: "blue" }
                ListElement { name: "Марс"; surfaceColor: "orange" }
                ListElement { name: "Юпитер"; surfaceColor: "orange" }
                ListElement { name: "Сатурн"; surfaceColor: "yellow" }
                ListElement { name: "Уран"; surfaceColor: "lightBlue" }
                ListElement { name: "Нептун"; surfaceColor: "lightBlue" }
            }
            PlanetItem {
                width: container.width / container.columns
                planetName: name
                planetColor: surfaceColor
            }
        }
    }
}
