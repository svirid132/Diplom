#include <QCoreApplication>
#include "src/MathLogic/MathLogic.h"
#include <QDebug>
#include <QDir>
#include "src/WafFile/wavfile.h"
#include <src/HandlerWavFile/handlerwavfile.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    float arr[5] = {1, 2, 3, 3.5, 1.5};
//    qDebug() << MathLogic::maxValue(arr, 5);

    HandlerWavFile handler;
    handler.handle(1, 2, 3, "");

    return a.exec();
}
