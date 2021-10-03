QT += testlib
QT += gui
CONFIG += qt warn_on depend_includepath testcase

TEMPLATE = app

#include(../MyApp_console/MyApp_consoleSrc.pri)
include(../MyApp_console.pri);

SOURCES +=  tst_mytesttesting.cpp \
    tst_mytesttesting_1.cpp


