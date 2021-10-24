import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ItemDelegate {
    id: delegate

    property bool selected: false

    contentItem: Rectangle {
        anchors.fill: delegate
        // Layout.fillWidth: true
    //    implicitWidth: delegate.width//естественная ширина
        // width: delegate.width + 30
        color: {
            if (selected) {
                return "#4587ED"
            }
            return row % 2 ? "#E8E8E8" : "white"
        }
        border.width: 1
        Text {
            text: model.display
            anchors.centerIn: parent
        }
    }

    //    contentItem: RowLayout {
    //        Rectangle {
    //            width: delegate.width / 5
    //            Text {
    //                text: name1
    //                anchors.centerIn: parent
    //            }
    //        }
    //        Rectangle {
    //            width: delegate.width / 5
    //            Text {
    //                text: K1.toFixed(2)
    //                anchors.centerIn: parent
    //            }
    //        }
    //        Rectangle {
    //            width: delegate.width / 5
    //            Text {
    //                text: K2.toFixed(2)
    //                anchors.centerIn: parent
    //            }
    //        }
    //        Rectangle {
    //            width: delegate.width / 5
    //            Text {
    //                text: K3.toFixed(2)
    //                anchors.centerIn: parent
    //            }
    //        }
    //        Rectangle {
    //            width: delegate.width / 5
    //            Text {
    //                text: K4.toFixed(2)
    //                anchors.centerIn: parent
    //            }
    //        }
    //    }
}
