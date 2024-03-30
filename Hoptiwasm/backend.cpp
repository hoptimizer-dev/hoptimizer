 #include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::registerQmlCreatableObjects()//QQmlContext *rootContext)
{
    qmlRegisterType<ViewController>("Hoptiwasm", 1, 0, "ViewController");
    // qmlRegisterType<EndstationViewController>("Hoptiwasm", 1, 0, "EndstationViewContrller");
    // qmlRegisterType<SwitchViewController>("Hoptiwasm", 1, 0, "SwitchViewController");
}

int Backend::registerViewController(ViewController *viewController)
{
    int currentCount = ++m_controllerCounter;
    m_viewController.insert(currentCount, viewController);
    return currentCount;
}

