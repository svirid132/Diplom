#ifndef COLLECTIONMODEL_H
#define COLLECTIONMODEL_H

#include <QAbstractListModel>

#include <src/Collection/collection.h>

class CollectionModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit CollectionModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    void setNames(const QStringList& names) { this->names = names; };

private:
    QStringList names;

    // QAbstractItemModel interface
public:
    int columnCount(const QModelIndex &parent) const override;
};

#endif // COLLECTIONMODEL_H
