#QT -= gui

QT += quick virtualkeyboard


CONFIG += c++11
#CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
        src/HandlerWavFile/handlerwavfile.h \
        src/MathLogic/MathLogic.h \
        src/WafFile/wavfile.h

SOURCES += \
        src/HandlerWavFile/handlerwavfile.cpp \
        src/MathLogic/MathLogic.cpp \
        src/MathLogic/MathLogicFunc.cpp \
        src/WafFile/wavfile.cpp

test {
    message(Configuring test build...)

    TEMPLATE = app
    TARGET = diplomtests

    QT += testlib

    SOURCES += \
        test/MathLogicTest.cpp

} else {

    SOURCES += \
            main.cpp\

    # Default rules for deployment.
    qnx: target.path = /tmp/$${TARGET}/bin
    else: unix:!android: target.path = /opt/$${TARGET}/bin
    !isEmpty(target.path): INSTALLS += target
}

RESOURCES += \
    qml.qrc
