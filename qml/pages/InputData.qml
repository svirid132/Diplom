import QtQuick 2.0
import QtQuick
import QtQuick.Window
import QtQuick.Shapes 1.15
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import "../content"

Item {
    id: root

    Rectangle {
        x: 72
        y: 84
        width: 1328
        height: 469
        border.width: 1
        border.color: "black"
        color: "#E5E5E5"
    }

    Label {
        x: 111
        y: 104
        font.pixelSize: 24
        font.bold: true
        text: "Данные"
    }

    InputVertical {
        x: 90
        y: 160
        width: 360
        labelText: "X"
    }

    InputVertical {
        x: 538
        y: 160
        width: 360
        labelText: "Y"
    }

    InputVertical {
        x: 996
        y: 160
        width: 360
        labelText: "Z"
    }

    InputVertical {
        x: 90
        y: 290
        width: 360
        labelText: "Lsh (Глубина штурма, м)"
    }

    InputVertical {
        x: 538
        y: 290
        width: 360
        labelText: "Nzam (кол-во измерений, шт)"
    }

    InputVertical {
        x: 996
        y: 290
        width: 360
        labelText: "h (Высота выработки, м)"
    }

//    Label {
//        x: 90
//        y: 406
//        text: "Породы"
//        font.pixelSize: 24
//    }

    LineComboBox {
        x: 90
        y: 406
        width: 984
        labelText: "Породы"
    }

    MyButton {
        x: 1126
        y: 398
        myText: "Коллекция"
    }

    MyButton {
        x: 878
        y: 580
        myText: "Вернуться"
    }

    MyButton {
        x: 1148
        y: 580
        myText: "Рассчитать"
    }
//    ComboBox {
//        x: 540
//        y: 406
//        model: ["-", "Файл XML"]
//    }
}
