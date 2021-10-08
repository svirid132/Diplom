#include <QCoreApplication>
#include "src/MathLogic/MathLogic.h"
#include <QDebug>
#include <QDir>
#include "src/WafFile/wavfile.h"
#include <src/HandlerWavFile/handlerwavfile.h>

//int main(int argc, char *argv[])
//{
//    QCoreApplication a(argc, argv);

//    float arr[5] = {1, 2, 3, 3.5, 1.5};
////    qDebug() << MathLogic::maxValue(arr, 5);

//    HandlerWavFile handler;
//    handler.handle(1, 2, 3, "");

//    return a.exec();
//}

#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
