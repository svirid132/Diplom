import QtQuick
import QtQuick.Window
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import "content"

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")
    color: "gray"

    InputHorizontal {
        y: 20
        width: (1280 / 2) - 80
        anchors.horizontalCenter: parent.horizontalCenter
//        font.pixelSize: 20
    }

    TextInput {
        id: texting
        text: "Text"
        x: 100
        y: 100
        width: 100
        height: 50
        visible: true
    }

//    GroupBox {
//        id: control
//        title: "groupBox"
//        width:  parent.width - 20
////        font.pixelSize: 21;
//        anchors.horizontalCenter: parent.horizontalCenter
//        background: Rectangle {
//            y: control.topPadding - control.bottomPadding
//            width: parent.width
//            height: parent.height - control.topPadding + control.bottomPadding
//            color: "transparent"
//            border.color: "#21be2b"
//            radius: 2
//        }

//        label: Label {
//            x: control.leftPadding
//            width: control.availableWidth
//            text: control.title
//            color: "#21be2b"
//            elide: Text.ElideRight
//        }

//        Label {
//            text: "this"
//        }

////        Row {
////            width: parent.width
////            spacing: 10
////            TextField {
////                placeholderText: "input text"
////                width: parent.width / 2 - 5
////                font.pixelSize: 18;
////                background: Rectangle {
////                    border.width: 1
////                    border.color: "black"
////                    radius: 5
////                }
////            }
////            TextField {
////                placeholderText: "input text"
////                width: parent.width / 2 - 5
////            }
////        }
//    }

//    Grid{

//    }

//    Column {
//        topPadding: 20
//        spacing: 20
//        GroupBox {
//            id: control
//            title: qsTr("GroupBox")
//            y: 100
//            topPadding: 20

//            background: Rectangle {
//                y: control.topPadding - control.bottomPadding
//                width: parent.width
//                height: parent.height - control.topPadding + control.bottomPadding
//                color: "transparent"
//                border.color: "#21be2b"
//                radius: 2
//            }

//            label: Label {
//                x: control.leftPadding
////                y: -font.pixelSize
//                width: control.availableWidth
//                text: control.title
//                color: "#21be2b"
//                elide: Text.ElideRight
//            }

//            Label {
//                text: qsTr("Content goes here!")
//            }
//        }

//        GroupBox {
//            id: control_1
//            title: qsTr("GroupBox")
//            y: 100

//            background: Rectangle {
//                y: control_1.topPadding - control_1.bottomPadding
//                width: parent.width
//                height: parent.height - control_1.topPadding + control_1.bottomPadding
//                color: "transparent"
//                border.color: "#21be2b"
//                radius: 2
//            }

//            label: Label {
//                x: control_1.leftPadding
//                y: -font.pixelSize
//                width: control_1.availableWidth
//                text: control_1.title
//                color: "#21be2b"
//                elide: Text.ElideRight
//            }

//            Label {
//                text: qsTr("Content goes here!")
//            }
//        }
//    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: 720
        anchors.horizontalCenter: parent.horizontalCenter

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
