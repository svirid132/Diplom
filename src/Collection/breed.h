#ifndef BREED_H
#define BREED_H

#include <QJsonObject>


struct Ks {
    float K1 = 0;
    float K2 = 0;
    float K3 = 0;
    float K4 = 0;
};

class Breed
{
public:
    Breed();
    Breed(QString name, float K1, float K2 = 0, float K3 = 0, float K4 = 0);
    void write(QJsonObject &json) const;
    void read(const QJsonObject &json);

    QString getName() const { return name; };
    Ks getKs() const { return ks; };

private:
    QString name;
    Ks ks;
};

#endif // BREED_H
