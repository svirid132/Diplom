#ifndef COLLECTIONREADER_H
#define COLLECTIONREADER_H

#include "collection.h"



class CollectionReader
{
public:
    CollectionReader();
    bool createEmptyFile();
    bool loadCollections();
    bool saveCollections();

    void setCollections(const QList<Collection> &collections) { this->collections = collections; };
    QList<Collection> getCollections() const { return collections; };

protected:
    //test
    void createNewCollection();

private:
    QList<Collection> collections;
};

#endif // COLLECTIONREADER_H
