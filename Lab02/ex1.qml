import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    ListView {
        id: listView
        width: parent.width
        height: parent.height

        spacing: 4
        model: ListModel {
                id: myModel
                ListElement { name: "Первый"; surfaceColor: "white"; tColor: "green" }
                ListElement { name: "Второй"; surfaceColor: "blue"; tColor: "purple" }
                ListElement { name: "Третий"; surfaceColor: "red"; tColor: "black" }
                ListElement { name: "Четвёртый"; surfaceColor: "blue"; tColor: "yellow" }
                ListElement { name: "Пятый"; surfaceColor: "yellow"; tColor: "blue" }
                ListElement { name: "Шестой"; surfaceColor: "black"; tColor: "red" }
                ListElement { name: "Седьмой"; surfaceColor: "red"; tColor: "yellow" }
                ListElement { name: "Восьмой"; surfaceColor: "yellow"; tColor: "black" }
        }
        delegate: RectangleWithText {
                rectangleName: surfaceColor
                rectangleColor: model.surfaceColor
                textColor: model.tColor
        }
    }
}