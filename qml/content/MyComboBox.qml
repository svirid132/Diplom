import QtQuick 2.0
import QtQuick.Controls

ComboBox {
    id: control
    width: 165
    height: 30
    leftInset: -5
    font.pixelSize: 16
    background: Rectangle {
        implicitHeight: 30
        radius: 20
        border.width: textField.activeFocus ? 2 : 0
        Image {
            x: parent.width - (19 + 15)
            anchors.verticalCenter: parent.verticalCenter
            source: "../assets/arrow_comboBox.svg"
        }
//            border.color: textField.activeFocus ? "blue" : "black"
    }
    delegate: ItemDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex == index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex == index
        hoverEnabled: control.hoverEnabled
    }
}
