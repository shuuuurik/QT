import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    ListView {
        id: view
        //anchors.centerIn: parent
        anchors.fill: parent
        spacing: 4
        model: ListModel {
            id: myModel
            ListElement { day: "Понедельник"; teacherName: "Кузьмин Е."; subject: "Теория алгоритмов" }
            ListElement { day: "Понедельник"; teacherName: "Шовгенов Д.А."; subject: "Дискретная математика" }
            ListElement { day: "Понедельник"; teacherName: "Тимофеев Е. А."; subject: "Анализ сложности алгоритмов" }
            ListElement { day: "Понедельник"; teacherName: "Домничев А. В."; subject: "Физкультура" }
            ListElement { day: "Понедельник"; teacherName: "Сухопарова А."; subject: "Экономика" }
            ListElement { day: "Вторник"; teacherName: "Башкин В.А."; subject: "Теория вычислительных процессов и структур" }
            ListElement { day: "Вторник"; teacherName: "Седов А.Г."; subject: "Линейная алгебра" }
            ListElement { day: "Вторник"; teacherName: "Богомолов Ю.В."; subject: "Основы математической статистики" }
            ListElement { day: "Среда"; teacherName: "Башкин В.А."; subject: "Теория вычислительных процессов и структур" }
            ListElement { day: "Среда"; teacherName: "Седов А.Г."; subject: "Линейная алгебра" }
            ListElement { day: "Среда"; teacherName: "Морозов А."; subject: "Математика" }
        }
        delegate: Rectangle {
            width: 300
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: parent
                width: parent.width
                Text {
                    text: model.teacherName
                    font { pointSize: 10; }
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.centerIn: parent
                }
                Text {
                    text: model.subject
                    font { pointSize: 14; }
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.centerIn: parent
                }
            }
        }

        section.property: "day"
        section.criteria: ViewSection.FullString
        section.delegate: Text {
            text: section
            font.bold: true
            font.pixelSize: 20
            //wrapMode: Text.WordWrap
            //horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
