#include <QCoreApplication>
#include "src/MathLogic.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    float arr[5] = {1, 2, 3, 3.5, 1.5};
    qDebug() << MathLogic::maxValue(arr, 5);

    return a.exec();
}
