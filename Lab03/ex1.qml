import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQml.XmlListModel

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("XML list model")

    XmlListModel {
        id: xmlListModel
        source: "valcurs.xml"
        query: "/ValCurs/Valute"
        XmlListModelRole {
            name: "Name"
            elementName: "Name"
        }
        XmlListModelRole {
            name: "cource"
            elementName: "Value"
        }
    }

    ListView {
        anchors.fill: parent
        model: xmlListModel
        delegate: Column {
            Text {
                font { pointSize: 12; }
                text: Name + ": " + cource
            }
        }
    }
}
