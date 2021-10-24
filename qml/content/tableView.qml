import QtQuick 2.0
import QtQuick.Controls

TableView {
    id: tableView
    width: 100
    height: 500

    model: ["123", "321"]
    clip: true

    TableViewColumn {
        id: idColumn
        title: "Id"
        role: "Id"
        //movable: false
        //resizable: false
        width: 40
    }
}
