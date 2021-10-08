import QtQuick
import QtQuick.Window
import QtQuick.VirtualKeyboard
import QtQuick.Controls

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    TextInput {
        id: texting
        text: "Text"
        x: 100
        y: 100
        width: 100
        height: 50
        visible: true
    }

    GroupBox {
        id: control
        title: "groupBox"
        width:  parent.width - 20
        y: 50
        font.pixelSize: 21;
        anchors.horizontalCenter: parent.horizontalCenter
        background: Rectangle {
            y: control.topPadding - control.bottomPadding
            width: parent.width
            height: parent.height - control.topPadding + control.bottomPadding
            color: "transparent"
            border.color: "#21be2b"
            radius: 2
        }

        label: Label {
            x: control.leftPadding
            width: control.availableWidth
            text: control.title
            color: "#21be2b"
            elide: Text.ElideRight
        }

        Label {
            text: "this"
        }

//        Row {
//            width: parent.width
//            spacing: 10
//            TextField {
//                placeholderText: "input text"
//                width: parent.width / 2 - 5
//                font.pixelSize: 18;
//                background: Rectangle {
//                    border.width: 1
//                    border.color: "black"
//                    radius: 5
//                }
//            }
//            TextField {
//                placeholderText: "input text"
//                width: parent.width / 2 - 5
//            }
//        }
    }


    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
