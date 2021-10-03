TEMPLATE = subdirs
CONFIG+=ordered
SUBDIRS += \
    MyApp_console \
    myApp \
    MyAppTesting

MyAppTesting.depends = MyApp_console
