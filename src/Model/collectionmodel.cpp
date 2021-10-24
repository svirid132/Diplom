#include "collectionmodel.h"

CollectionModel::CollectionModel(QObject *parent) : QAbstractListModel(parent)
{

}

int CollectionModel::rowCount(const QModelIndex & = QModelIndex()) const
{
    return names.length();
}

int CollectionModel::columnCount(const QModelIndex&) const
{
    return 1;
}


QVariant CollectionModel::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case Qt::DisplayRole:
        return names[index.row()];
    default:
        break;
    }

    return QVariant();
}


QHash<int, QByteArray> CollectionModel::roleNames() const
{
    return {
        { Qt::DisplayRole, "display" }//For qt and qml
    };
}
