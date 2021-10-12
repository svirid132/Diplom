import QtQuick 2.0
import QtQuick.Controls

Item {

    id: root
    property string labelText: "value"

    Row {
        width: parent.width
        Label {
            width: 447
            text: labelText
            font.pixelSize: 21
            anchors.verticalCenter: parent.verticalCenter
        }
        MyComboBox {
            width: root.width - 447
        }
    }

}
