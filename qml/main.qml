import QtQuick
import QtQuick.Window
import QtQuick.Shapes 1.15
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import "content"
import "pages"

Window {
    id: window
    width: 1440
    height: 1026
    visible: true
    title: qsTr("Hello World")
    color: "#E5E5E5"

    StackView {
        id: stack
        initialItem: user
        anchors.fill: parent

//        pushEnter: Transition {
//            PropertyAnimation {
//                property: "opacity"
//                from: 0
//                to:1
//                duration: 200
//            }
//        }
//        pushExit: Transition {
//            PropertyAnimation {
//                property: "opacity"
//                from: 1
//                to:0
//                duration: 200
//            }
//        }
//        popEnter: Transition {
//            PropertyAnimation {
//                property: "opacity"
//                from: 0
//                to:1
//                duration: 200
//            }
//        }
//        popExit: Transition {
//            PropertyAnimation {
//                property: "opacity"
//                from: 1
//                to:0
//                duration: 200
//            }
//        }
    }

    Collection{
        anchors.fill: parent
    }

//    Rectangle {
//        id: root
//        anchors.fill: parent
//        state: "red_color"

//        states: [
//            State {
//                name: "red_color"
//                PropertyChanges { target: root; color: "red" }
//                PropertyChanges { target: flag; state: "FLAG_DOWN"} //Если требуется другого задеть
//            },
//            State {
//                name: "blue_color"
//                PropertyChanges { target: root; color: "blue" }
//            }
//        ]
//    }

    Button {
        x: 200
        y: 200
        width: 200
        height: 30
//        checkable: true

        //onClicked:
        onClicked: stack.push(user)
        onCheckedChanged: {//Только для cheked
            console.log(checked)
            root.state = checked ? "blue_color" : "red_color"
        }
//        onCheckableChanged: {
//            root.state = checked ? "blue_color" : "red"
//        }
    }

//    User {
//        id: user
//        anchors.fill: parent
//        visible: stack.depth == 3
//    }

    InputData {
        anchors.fill: parent
    }

    Item {
        id: comp
        Button{
            text: "I buuton"
        }

        Label {
            id: label
            x: 200
            text: stack.depth
        }

//        Rectangle {
//            width: 100
//            height: 100
//            color: "black"
//        }
    }

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
