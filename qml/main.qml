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

//    tableView {

//    }

    StackView {
        id: stack
        initialItem: collection
        anchors.fill: parent

        Collection {
            id: collection
            anchors.fill: parent
            onPressAndHold: {
                contactMenu.open()
            }
    //        collectionModel: MyModel
            preedModel: MyModel
            onClicked: console.log(row, column)
        }
    }

    Menu {
        id: contactMenu
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        modal: true
        spacing: 5

        Label {
            padding: 10
            font.bold: true
            width: parent.width
            horizontalAlignment: Qt.AlignHCenter
            text: "this"
        }
        MenuItem {
            text: qsTr("Edit...")
//            font.pixelSize: 20
//            Text {
//                text: "Изменить"
//                anchors.verticalCenter: parent.verticalCenter
//                x: 10
//                font.pixelSize: 16
//            }

            background: Rectangle{
                                implicitWidth: parent.width
                                implicitHeight: parent.height
                                color: "#ff9900"
                                border.width: 2*topWindow.sizeFactor; border.color: "#4c4d4f"
                            }
            onTriggered: {
                console.log("console.log");
            }
//            shortcut: "Ctrl+E,Ctrl+W"
        }

        MenuSeparator {}

        MenuItem {
            height: 30
            Text {
                text: "Удалить"
                color: "red"
                anchors.verticalCenter: parent.verticalCenter
                x: 10
                font.pixelSize: 16
            }
            onTriggered: contactView.model.remove(currentContact)
        }

        MenuSeparator {}

        Button {
            width: 200
            height: 50
            palette.button: "red"
            onClicked: {
                contactMenu.close()
            }
        }
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
