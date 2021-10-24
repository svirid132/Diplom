import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    spacing: 0

    Rectangle {
        border.width: 1
        Layout.minimumWidth: parent.width / 5
        color: row % 2 ? "E8E8E8" : "white"
        Text {
            text: qsTr(text)
            anchors.centerIn: parent
        }
    }

    Rectangle {
        border.width: 1
        Layout.minimumWidth: parent.width / 5
        color: row % 2 ? "E8E8E8" : "white"
        Text {
            text: qsTr(K1)
            anchors.centerIn: parent
        }
    }

    Rectangle {
        border.width: 1
        Layout.minimumWidth: parent.width / 5
        color: row % 2 ? "E8E8E8" : "white"
        Text {
            text: qsTr(K2)
            anchors.centerIn: parent
        }
    }

    Rectangle {
        border.width: 1
        Layout.minimumWidth: parent.width / 5
        color: row % 2 ? "E8E8E8" : "white"
        Text {
            text: qsTr(K3)
            anchors.centerIn: parent
        }
    }

    Rectangle {
        border.width: 1
        Layout.minimumWidth: parent.width / 5
        color: row % 2 ? "E8E8E8" : "white"
        Text {
            text: qsTr(K4)
            anchors.centerIn: parent
        }
    }
}
