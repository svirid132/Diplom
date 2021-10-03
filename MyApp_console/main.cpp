#include <QCoreApplication>
#include <QDebug>
#include "func/sum.cpp"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    qDebug() << sum(2, 3);

    return a.exec();
}
