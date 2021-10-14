#QT -= gui

QT += qml quick virtualkeyboard

#CONFIG += qmltypes
#QML_IMPORT_NAME = CollectionModel
#QML_IMPORT_MAJOR_VERSION = 1

CONFIG += c++11
#CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
        src/Collection/breed.h \
        src/Collection/collection.h \
        src/Collection/collectionreader.h \
        src/HandlerWavFile/handlerwavfile.h \
        src/MathLogic/MathLogic.h \
        src/Model/breedsmodel.h \
        src/Model/collectionmodel.h \
        src/Senders/collectionmodelsender.h \
        src/Senders/preedsmodelsender.h \
        src/WafFile/wavfile.h

SOURCES += \
        src/Collection/breed.cpp \
        src/Collection/collection.cpp \
        src/Collection/collectionreader.cpp \
        src/HandlerWavFile/handlerwavfile.cpp \
        src/MathLogic/MathLogic.cpp \
        src/MathLogic/MathLogicFunc.cpp \
        src/Model/breedsmodel.cpp \
        src/Model/collectionmodel.cpp \
        src/Senders/collectionmodelsender.cpp \
        src/Senders/preedsmodelsender.cpp \
        src/WafFile/wavfile.cpp

INCLUDEPATH += \
    src/Model #Чтобы запустить программу

test {
    message(Configuring test build...)

    TEMPLATE = app
    TARGET = diplomtests

    QT += testlib

    SOURCES += \
        test/MathLogicTest.cpp

} else {

    TEMPLATE = app

    SOURCES += \
            main.cpp\

    # Default rules for deployment.
    qnx: target.path = /tmp/$${TARGET}/bin
    else: unix:!android: target.path = /opt/$${TARGET}/bin
    !isEmpty(target.path): INSTALLS += target
}

RESOURCES += \
    qml.qrc
