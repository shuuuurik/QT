import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.3

Window {
    width: 1600
    height: 800
    visible: true
    title: qsTr("Schedule")
    GridLayout {
        anchors.centerIn: parent
        columns: 7; layoutDirection: Qt.LeftToRight
        columnSpacing : 30
        rowSpacing : 10
        Rectangle {
            Layout.column: 1
            color: "yellow"
            width: 200
            height: 50
            Text {
                text: "Понедельник"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "yellow"
            width: 200
            height: 50
            Text {
                text: "Вторник"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "yellow"
            width: 200
            height: 50
            Text {
                text: "Среда"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "yellow"
            width: 200
            height: 50
            Text {
                text: "Четверг"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "yellow"
            width: 200
            height: 50
            Text {
                text: "Пятница"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            color: "yellow"
            width: 200
            height: 50
            Text {
                text: "Суббота"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 50
            height: 50
            Text {
                text: "1"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Неклассические логики"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Программная инженерия"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Неклассические логики"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Сети Петри"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
        }

        Rectangle {
            width: 50
            height: 50
            Text {
                text: "2"
                color: "black"
                font { pointSize: 20; bold: true }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "ОС Аврора"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Экономика"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Введение в математическую статистику"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: 200
            height: 200
            border { color: "black"; width: 5 }
            Text {
                text: "Основы права"
                color: "black"
                width: parent.width - 20
                wrapMode: Text.WordWrap
                font { pointSize: 16; }
                anchors.centerIn: parent
            }
        }

    }

}
