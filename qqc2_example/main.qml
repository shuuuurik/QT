import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Dialog")
        }
    }

    MouseArea {
        anchors.top: bar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        onPressAndHold: contextMenu.popup()
        Menu {
            id: contextMenu
            MenuItem { text: "Cut" }
            MenuItem { text: "Copy" }
            MenuItem { text: "Paste" }
        }
    }

    StackLayout {
        width: parent.width
        anchors.top: bar.bottom
        currentIndex: bar.currentIndex
        ColumnLayout {
            id: homeTab
            TextField {
                placeholderText: qsTr("Enter name")
                validator: RegularExpressionValidator { regularExpression: /[0-9A-F]+/ }
                text: "AF"
                onTextEdited: console.log(acceptableInput)
            }
            ScrollView {
                id: view
                height: 100
                TextArea {
                    height: parent.height
                    text: "TextArea\n...\n...\n...\n...\n...\n...\n"
                }
            }
            ComboBox {
                editable: true
                model: ListModel {
                    id: model
                    ListElement { text: "Banana" }
                    ListElement { text: "Apple" }
                    ListElement { text: "Coconut" }
                }
                onAccepted: {
                    if (find(editText) === -1)
                        model.append({text: editText})
                }
            }
            Slider {
                id: slider
                from: 1
                value: 25
                stepSize: 1
                to: 100
            }
            Label {
                text: slider.value
            }
            Switch {
                text: qsTr("Wi-Fi")
                onClicked: console.log(checked)
            }
            GroupBox {
                title: qsTr("Synchronize")
                ColumnLayout {
                    anchors.fill: parent
                    CheckBox { text: qsTr("E-mail") }
                    CheckBox { text: qsTr("Calendar") }
                    CheckBox { text: qsTr("Contacts") }
                }
            }
        }
        ColumnLayout {
            id: dialogTab
            anchors.fill: parent
            Label {
                id: label
                width: parent.width
                text: qsTr("Dialog example")
            }
            SimpleDialog {id: dialog; title: "New dialog" }
            Button {
                text: qsTr("Open dialog")
                onClicked: {
                    dialog.open();
                    dialog.accepted.connect(function() {
                        label.text = "Dialog is accepted";
                    });
                }
            }
        }
        Item {
            id: activityTab
        }
    }
}
