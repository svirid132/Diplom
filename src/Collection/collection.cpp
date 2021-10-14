#include "collection.h"

#include <QJsonArray>
#include <QJsonObject>

Collection::Collection()
{

}

void Collection::read(const QJsonObject &json)
{
    if (json.contains("name") && json["name"].isString()) {
        name = json["name"].toString();
    }

    if (json.contains("breeds") && json["breeds"].isArray()) {
        QJsonArray array = json["breeds"].toArray();
        breeds.clear();
        breeds.reserve(array.size());
        for (int index = 0; index < array.size(); ++index) {
            QJsonObject object = array[index].toObject();
            Breed breed;
            breed.read(object);
            breeds.append(breed);
        }
    }
}

void Collection::write(QJsonObject &json) const
{
    json["name"] = this->name;
    QJsonArray array;
    for (const Breed &breed : breeds) {
        QJsonObject object;
        breed.write(object);
        array.append(object);
    }
    json["breeds"] = array;
}
