#include "collectionreader.h"

#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>

CollectionReader::CollectionReader()
{

}

void CollectionReader::createNewCollection()
{
    Collection collection = Collection("Коллекция 1");
    QList<Breed> breeds;
    breeds.append(Breed("Рубиноид_1", 2.35, 6.78, 7.20, 1.78));
    breeds.append(Breed("Рубиноид_2", 2.35, 6.78, 7.20));
    breeds.append(Breed("Рубиноид_3", 2.35, 6.78));
    breeds.append(Breed("Рубиноид_4", 2.35));
    collection.setBreeds(breeds);

    QFile saveFile("save.json");
    if(!saveFile.open(QIODevice::WriteOnly)) {
        qWarning("Невозможно записать в файл save.json");
        return;
    }
    QJsonObject json;

    QJsonObject object;
    collection.write(object);
    QJsonArray array;
    array.append(object);
    json["collections"] = array;

//    QJsonArray array;
//    for (const Breed &breed : breeds) {
//        QJsonObject object;
//        breed.write(object);
//        array.append(object);
//    }
//    json["breeds"] = array;

    saveFile.write(QJsonDocument(json).toJson());
    saveFile.close();
}

bool CollectionReader::createEmptyFile()
{
    QFile saveFile("save.json");
    if(!saveFile.open(QIODevice::WriteOnly)) {
        qWarning("Невозможно создать пустой файл save.json");
        return false;
    }
    saveFile.close();
    return true;
}

bool CollectionReader::loadCollections()
{
    QFile saveFile("save.json");
    if(!saveFile.open(QIODevice::ReadOnly)) {
        qWarning("Невозможно прочитать файл save.json");
        return false;
    }

    QByteArray saveData = saveFile.readAll();
    QJsonDocument doc( QJsonDocument::fromJson(saveData) );
    QJsonObject json = doc.object();

    if (json.contains("collections") && json["collections"].isArray()) {
        QJsonArray array = json["collections"].toArray();
        collections.clear();
        collections.reserve(array.size());
        for (int index = 0; index < array.size(); ++index) {
            QJsonObject object = array[index].toObject();
            Collection collection;
            collection.read(object);
            collections.append(collection);
        }
    }

    saveFile.close();
    return true;
}

bool CollectionReader::saveCollections()
{
    QFile saveFile("save.json");
    if(!saveFile.open(QIODevice::WriteOnly)) {
        qWarning("Невозможно записать в файл save.json");
        return false;
    }
    QJsonObject json;

    QJsonArray array;
    for (int index = 0; index < collections.size(); ++index) {
        QJsonObject object;
        collections[index].write(object);
        array.append(object);
    }
    json["collections"] = array;

    saveFile.write(QJsonDocument(json).toJson());
    saveFile.close();
    return true;
}
