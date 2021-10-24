import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4

//https://stackoverflow.com/questions/25945229/how-to-change-the-color-background-text-of-header-of-tableview-in-qt5/25946022
//https://stackoverflow.com/questions/60052599/qml-tableview-change-row-color-depending-on-row-content?rq=1
https://www.qtcentre.org/threads/59657-TableView-Change-background-color-if-row-have-specific-value
Rectangle {
    id: win
    width: 360
    height: 360
    visible: true

    ListModel {
        id: libraryModel
        ListElement {
            title: "A Masterpiece"
            author: "Gabriel"
        }
        ListElement {
            title: "Brilliance"
            author: "Jens"
        }
        ListElement {
            title: "Outstanding"
            author: "Frederik"
        }
    }

    TableView {
        TableViewColumn {
            role: "title"
            title: "Title"
            width: 100
        }
        TableViewColumn {
            role: "author"
            title: "Author"
            width: 200
        }
        model: libraryModel

        style: TableViewStyle {
            headerDelegate: Rectangle {
                height: textItem.implicitHeight * 1.2
                width: textItem.implicitWidth
                color: "lightsteelblue"
                Text {
                    id: textItem
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: styleData.textAlignment
                    anchors.leftMargin: 12
                    text: styleData.value
                    elide: Text.ElideRight
                    color: textColor
                    renderType: Text.NativeRendering
                }
                Rectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 1
                    anchors.topMargin: 1
                    width: 1
                    color: "#ccc"
                }
            }
        }
    }
}
