import QtQuick 2.0
import QtQuick.Controls

import QtQml 2.12
import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

//import CollectionModel 1.0

Item {

    id: root
//    property alias collectionModel: table.model
    property alias preedModel: list.model
    signal clicked(int row, int column)

    Item {
        id: collection
        x: 55
        y: 118
        width: 244
        Column {
            Rectangle {
                id: listHeader
                height: 39
                width: collection.width
                color: "#C4C4C4"

                Text {
                    id: listHeaderText
                    text: qsTr("Названия")
                    font.pixelSize: 24
                    anchors.verticalCenter: listHeader.verticalCenter
                    anchors.horizontalCenter: listHeader.horizontalCenter
                }
            }
            ListView {
                id: list
                height: 478
                width: collection.width
                delegate: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 50
                    Text {
                        text: display
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: root.clicked(row, column)
                    }
                }
            }
        }
    }

//    TableView {
//        id: table
//        x: 298
//        y: 212
//        anchors.fill: parent
//        columnSpacing: 1
//        rowSpacing: 1
//        clip: true

//        delegate: Rectangle {
//            implicitWidth: 218
//            implicitHeight: 36
//            Text {
//                text: display
//            }
//            MouseArea{
//                anchors.fill: parent
//                onClicked: root.clicked(row, column)
//            }
//        }
//    }

}
