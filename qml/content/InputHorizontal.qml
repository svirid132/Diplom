import QtQuick
import QtQuick.Controls

Item {
    id: inputHorizontal
    Row {
        Label {
            width: inputHorizontal.width / 3
            font.pixelSize: 20
            text: "MyText"
        }

        TextField {
            id: textField
            width: inputHorizontal.width * 2 / 3
            font.pixelSize: 20
            leftInset: -5
            background: Rectangle {
                radius: 20
                border.width: 2
                border.color: textField.activeFocus ? "blue" : "black"
            }
        }
    }
}
