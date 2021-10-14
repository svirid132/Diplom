#include "collectionmodel.h"

CollectionModel::CollectionModel(QObject *parent) : QAbstractListModel(parent)
{

}

int CollectionModel::rowCount(const QModelIndex & = QModelIndex()) const
{
    return 200;
}

QVariant CollectionModel::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case Qt::DisplayRole:
        return QString("%1, %2").arg(index.column()).arg(index.row());
    default:
        break;
    }

    return QVariant();
}


QHash<int, QByteArray> CollectionModel::roleNames() const
{
    return {
        { Qt::DisplayRole, "display" }
    };
}


int CollectionModel::columnCount(const QModelIndex &parent) const
{
    return 2;
}
