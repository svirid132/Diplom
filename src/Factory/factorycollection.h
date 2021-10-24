#ifndef FACTORYCOLLECTION_H
#define FACTORYCOLLECTION_H

#include <QObject>
#include <QQuickItem>
#include "../Model/collectionmodel.h"
#include "../Collection/collectionreader.h"

class FactoryCollection : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
//    QML_ELEMENT
public:
    explicit FactoryCollection(QObject *parent = nullptr);
    CollectionModel* getCollectionModel() { return collectionModel; };
    Q_INVOKABLE void getDebug() { qDebug() << "Debug in Qt"; };
    Q_INVOKABLE QString getString() { return "get String"; };


private:
    CollectionModel *collectionModel { new CollectionModel() };
    CollectionReader *reader {new CollectionReader() };
    QList<Collection> collections;

signals:

};

#endif // FACTORYCOLLECTION_H
