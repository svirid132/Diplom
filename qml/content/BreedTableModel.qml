import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.qmlmodels 1.0

TableModel {
    TableModelColumn { display: "name" }
    TableModelColumn { display: "K1" }
    TableModelColumn { display: "K2" }
    TableModelColumn { display: "K3" }
    TableModelColumn { display: "K4" }

    rows: [
        {
            name: "Рубиноид",
            K1: 123.23,
            K2: 323.21,
            K3: 432.21,
            K4: 9.2
        },
        {
            name: "Ванилиь",
            K1: 123.23,
            K2: 323.21,
            K3: 432.21,
            K4: 9.2
        },
        {
            name: "Карамель",
            K1: 123.23,
            K2: 323.21,
            K3: 432.21,
            K4: 9.2
        }
    ]
}
