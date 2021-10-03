#include "myapp.h"
#include "myappplugin.h"

#include <QtPlugin>

MyAppPlugin::MyAppPlugin(QObject *parent)
    : QObject(parent)
{
    m_initialized = false;
}

void MyAppPlugin::initialize(QDesignerFormEditorInterface * /* core */)
{
    if (m_initialized)
        return;

    // Add extension registrations, etc. here

    m_initialized = true;
}

bool MyAppPlugin::isInitialized() const
{
    return m_initialized;
}

QWidget *MyAppPlugin::createWidget(QWidget *parent)
{
    return new MyApp(parent);
}

QString MyAppPlugin::name() const
{
    return QLatin1String("MyApp");
}

QString MyAppPlugin::group() const
{
    return QLatin1String("");
}

QIcon MyAppPlugin::icon() const
{
    return QIcon();
}

QString MyAppPlugin::toolTip() const
{
    return QLatin1String("");
}

QString MyAppPlugin::whatsThis() const
{
    return QLatin1String("");
}

bool MyAppPlugin::isContainer() const
{
    return false;
}

QString MyAppPlugin::domXml() const
{
    return QLatin1String("<widget class=\"MyApp\" name=\"myApp\">\n</widget>\n");
}

QString MyAppPlugin::includeFile() const
{
    return QLatin1String("myapp.h");
}
#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(myappplugin, MyAppPlugin)
#endif // QT_VERSION < 0x050000
