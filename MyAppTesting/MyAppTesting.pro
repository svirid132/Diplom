QT += testlib
QT += gui
CONFIG += qt warn_on depend_includepath testcase

TEMPLATE = app

include(../MyApp_console.pri);

SOURCES +=  tst_mytesttesting.cpp


