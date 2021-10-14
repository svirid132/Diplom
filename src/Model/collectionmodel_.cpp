#include "collectionmodel_.h"

CollectionModel::CollectionModel()
{

}

int CollectionModel::rowCount(const QModelIndex & = QModelIndex()) const
{
    return 200;
}

int CollectionModel::columnCount(const QModelIndex & = QModelIndex()) const
{
    return 5;
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
