#include <QCoreApplication>
#include "src/MathLogic/MathLogic.h"
#include <QDebug>
#include <QDir>
#include "src/WafFile/wavfile.h"
#include <src/HandlerWavFile/handlerwavfile.h>
#include <src/Model/collectionmodel.h>

//int main(int argc, char *argv[])
//{
//    QCoreApplication a(argc, argv);

//    float arr[5] = {1, 2, 3, 3.5, 1.5};
////    qDebug() << MathLogic::maxValue(arr, 5);

//    HandlerWavFile handler;
//    handler.handle(1, 2, 3, "");

//    return a.exec();
//}

#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <src/Collection/collectionreader.h>


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    //    engine.setInitialProperties({{ "model", QVariant::fromValue(dataList) }}); // Где dataList = QStringList

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    CollectionModel model;
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("MyModel", &model);
//    engine.setInitialProperties({{ "model", QVariant::fromValue(&model) }}); // Где dataList = QStringList

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    CollectionReader reader;
//    if (!reader.loadCollections()) {
//        reader.createEmptyFile();
//    }


//    reader.createNewCollection();
//    reader.read();
//    reader.getCollections();

    return app.exec();
}
