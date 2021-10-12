import QtQuick 2.0
import QtQuick.Controls

Item {
    id: root
    property string labelText: "value"

    Column {
        spacing: 6
        Label {
            width: root.width
            font.pixelSize: 21
            text: labelText
        }

        TextField {
            id: textField
            width: root.width
//            x: inputHorizontal.width - width
            selectByMouse: true
//            width: inputHorizontal.width * 2 / 3
//            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
            leftInset: -5
            background: Rectangle {
                implicitHeight: 30
                radius: 20
                border.width: textField.activeFocus ? 2 : 0
                border.color: textField.activeFocus ? "blue" : "black"
            }
        }
    }
}
