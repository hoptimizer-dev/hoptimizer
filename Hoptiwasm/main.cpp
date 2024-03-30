#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "backend.h"
// #include "switchviewcontroller.h"
// #include "endstationviewcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt/qml/Hoptiwasm/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.addImportPath(":/qt/qml");

    engine.rootContext()->setContextProperty("_mbackend", main_backend::Instance());
    main_backend::Instance()->registerQmlCreatableObjects();
    // qmlRegisterType<EndstationViewController>("Hoptiwasm", 1, 0, "EndstationViewContrller");
    // qmlRegisterType<SwitchViewController>("Hoptiwasm", 1, 0, "SwitchViewController");

    engine.load(url);

    return app.exec();
}
