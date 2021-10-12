import QtQuick 2.0
import QtQuick.Controls

import QtQml 2.12
import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import CollectionModel 1.0

Item {

    TableView {
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: CollectionModel {}

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            Text {
                text: display
            }
        }
    }

}
