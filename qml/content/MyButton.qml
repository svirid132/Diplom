import QtQuick 2.0
import QtQuick.Controls

Button {
    width: 232
    height: 48

    property alias myText: content.text

    contentItem: Text {
        id: content
//        text: text
//            font: control.font
        font.pixelSize: 21
        opacity: enabled ? 1.0 : 0.3
//            color: control.down ? "#ffffff" : "#ffffff"
        color: "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

    }
    background: Rectangle {
        color: "#4587ED"
    }
}
