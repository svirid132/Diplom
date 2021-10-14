#ifndef COLLECTION_H
#define COLLECTION_H

#include "breed.h"

#include <QList>



class Collection
{
public:
    Collection();
    Collection(const QString& name) { this->name = name; };

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    QString getName() const {return name;};
    QList<Breed> getBreeds() const { return breeds; };
    void setBreeds(const QList<Breed> &breeds) { this->breeds = breeds; };

private:
    QString name;
    QList<Breed> breeds;
};

#endif // COLLECTION_H
