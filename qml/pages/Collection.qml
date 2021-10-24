import QtQuick 2.0
import QtQuick.Controls

import QtQml 2.12
import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Backend 1.0

Item {

    id: root
//    property alias collectionModel: table.model
    property alias preedModel: list.model
    signal clicked(int row, int column)
    signal pressAndHold()

    FactoryCollection {
        id: logic
    }

    Item {
        id: collection
        x: 55
        y: 118

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
                width: 100
                clip: true

                RoundButton {
                    text: qsTr("+")
                    highlighted: true
                    anchors.margins: 10
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    palette.button: "red"
                    onClicked: {
//                        for(let prop in logic) {
//                            console.log(prop);
//                        }
                        logic.getDebug()
                    }
                }

                delegate: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 50
                    Text {
                        text: display
                    }
                    MouseArea{
                        anchors.fill: parent
//                        onClicked: root.clicked(row, column)
                        onPressAndHold: {
                            root.pressAndHold()
                        }
                    }
                }
            }
        }
    }

}
