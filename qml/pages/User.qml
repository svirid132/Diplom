import QtQuick 2.0
import QtQuick
import QtQuick.Window
import QtQuick.Shapes 1.15
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import "../content"

Item {

    property alias onNext: nextButton.onClicked

    Rectangle {
        border.width: 1
        border.color: "black"
        y: 84
        width: 1328
        height: 469
        color: "#E5E5E5"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        x: 111
        y: 104
        font.pixelSize: 24
        font.bold: true
        text: "Данные"
    }

    InputHorizontal {
        x: 102
        y: 173
        width: 588
        labelText: "Измерение выполнил"
//        anchors.horizontalCenter: parent.horizontalCenter
//        font.pixelSize: 20
    }

    InputHorizontal {
        x: 752
        y: 173
        width: 609
        labelText: "Подразделение"
    }

    InputHorizontal {
        x: 100
        y: 254
        width: 981
        labelText: "Рудник"
    }

    InputHorizontal {
        x: 100
        y: 318
        width: 981
        labelText: "Наименование выработки"
    }

    InputHorizontal {
        x: 100
        y: 382
        width: 981
        labelText: "Файлы импульсов"
    }

    Button {
        width: 232
        height: 48
        x: 1129
        y: 374
        contentItem: Text {
            text: "Обзор"
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

    InputHorizontal {
        x: 100
        y: 463
        width: 981
        labelText: "Вывод результата"
    }

    ComboBox {
        id: control
        x: 350
        y: 464
        width: 165
        height: 30
        leftInset: -5
        model: ["-", "Файл XML"]
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


    Button {
        width: 232
        height: 48
        x: 1129
        y: 455
        contentItem: Text {
            text: "Обзор"
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

    Button {
        id: nextButton
        width: 232
        height: 48
        x: 1155
        y: 596
        contentItem: Text {
            text: "К расчетам"
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
}
