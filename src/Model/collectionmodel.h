#ifndef COLLECTIONMODEL_H
#define COLLECTIONMODEL_H

#include <qqml.h>
#include <QAbstractTableModel>
#include <QObject>

class CollectionModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    CollectionModel();

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
};

#endif // COLLECTIONMODEL_H
