#ifndef BREEDSMODEL_H
#define BREEDSMODEL_H

#include <QAbstractTableModel>

class BreedsModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    explicit BreedsModel(QObject *parent = nullptr);
};

#endif // BREEDSMODEL_H
