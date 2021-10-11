import QtQuick
import QtQuick.Controls

Item {
    id: inputHorizontal
    property string labelText: "value"
    Row {
        Label {
            width: 0.45 * inputHorizontal.width
            font.pixelSize: 24
            text: labelText
        }

        TextField {
            id: textField
            width: 0.55 * inputHorizontal.width
            x: inputHorizontal.width - width
            selectByMouse: true
//            width: inputHorizontal.width * 2 / 3
            anchors.verticalCenter: parent.verticalCenter
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
