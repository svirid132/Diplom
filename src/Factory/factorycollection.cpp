#include "factorycollection.h"

FactoryCollection::FactoryCollection(QObject *parent) : QObject(parent)
{
    if (reader->loadCollections()) {
        collections = reader->getCollections();
    } else {
        if (reader->createEmptyFile()) {
            qWarning() << "error create empty file";
        }
    }
}


