import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ItemDelegate {
    id: delegate

    contentItem: Rectangle {
        anchors.fill: delegate
        border.width: 1
        color: "#C4C4C4"
        Text {
            text: qsTr(name)
            anchors.centerIn: parent
        }
    }
}
