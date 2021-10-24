import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

GridLayout {

    id: grid

    rows: 3
    columns: 2

    //    color: "red"
    height: 480
    rowSpacing: 0
    columnSpacing: 0
    width: 640

    Rectangle {
        height: 60
        Layout.fillWidth: true
        color: "transparent"
        Layout.minimumHeight: 30
        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        Layout.columnSpan: 2
        Text {
            id: collectionText
            text: "Коллекции"
            font.pixelSize: 24
            leftPadding: 16
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: headerColection
        Layout.minimumWidth: grid.width * 0.2
        color: "#C4C4C4"
        height: 30
        border.width: 1
        Layout.minimumHeight: 30
        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        Text {
            id: name
            text: qsTr("Названия")
            anchors.centerIn: headerColection
        }
    }
    Rectangle {
        id: headerBreed
        Layout.minimumWidth: grid.width * 0.8
        height: 30
        border.width: 1
        Layout.minimumHeight: 30
        color: "#C4C4C4"
        Layout.alignment: Qt.AlignRight | Qt.AlignTop
        Text {
            id: name1
            text: qsTr("Породы в коллекции")
            anchors.centerIn: headerBreed
        }
    }

    ListView {
        id: listCollection
        Layout.minimumWidth: grid.width * 0.2
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    }

    Item {
        id: tableBreed
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignRight | Qt.AlignTop
        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            ListView {
                id: headerTableBreed
                orientation: ListView.Horizontal
                Layout.alignment: Qt.AlignTop
                width: tableBreed.width
                Layout.minimumHeight: 30
                boundsBehavior: Flickable.StopAtBounds //позволяе не парится с прокруткоц
                model: BreedHeaderModel {}
                delegate: BreedHeaderDelegate {
                    width: headerTableBreed.width / 5
                    height: headerTableBreed.height
                }
            }
            Rectangle {
                id: background
                Layout.fillWidth: true
                Layout.fillHeight: true
                border.width: 1
                TableView {
                    id: dataTableBreed
                    anchors.fill: parent
                    clip: true //обрезать при переполнении?
                    flickableDirection: Flickable.VerticalFlick
                    boundsBehavior: Flickable.StopAtBounds //позволяе не парится с прокруткоц
                    Layout.alignment: Qt.AlignTop
                    //                backgroundVisible: true
                    delegate: BreedTableDelegate {
                        implicitWidth: dataTableBreed.width / 5
                        selected: row == rowSelected ?  true : false
                        //Статья про implicitWidth:
                        //https://stackoverflow.com/questions/45946808/difference-between-width-height-and-implicitwidth-height-and-corresponding-use
                        height: headerTableBreed.height
                        MouseArea {
                            anchors.fill: parent
                            onClicked: rowSelected = row
                        }
                    }
                    model: BreedTableModel {}

                    property int rowSelected: -1

                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

