#include "breed.h"

Breed::Breed()
{

}

Breed::Breed(QString name, float K1, float K2, float K3, float K4)
{
    this->name = name;
    ks.K1 = K1;
    ks.K2 = K2;
    ks.K3 = K3;
    ks.K4 = K4;
}

void Breed::write(QJsonObject &json) const
{
    json["name"] = name;
    json["K1"] = ks.K1;
    if (ks.K2 != 0) json["K2"] = ks.K2;
    if (ks.K3 != 0) json["K3"] = ks.K3;
    if (ks.K4 != 0) json["K4"] = ks.K4;
}

void Breed::read(const QJsonObject &json)
{
    if (json.contains("name") && json["name"].isString()) {
        name = json["name"].toString();
    }

    if (json.contains("K1") && json["K1"].isDouble()) {
        ks.K1 = static_cast<float>(json["K1"].toDouble());
    }

    if (json.contains("K2") && json["K2"].isDouble()) {
        ks.K2 = static_cast<float>(json["K2"].toDouble());
    }

    if (json.contains("K3") && json["K3"].isDouble()) {
        ks.K3 = static_cast<float>(json["K3"].toDouble());
    }

    if (json.contains("K4") && json["K4"].isDouble()) {
        ks.K4 = static_cast<float>(json["K4"].toDouble());
    }
}
