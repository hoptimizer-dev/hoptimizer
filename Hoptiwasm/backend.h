#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QQmlContext>

#include <QMap>

#include "singletonpattern.h"

#include "viewcontroller.h"

class Backend : public QObject
{
    Q_OBJECT

public:
    explicit Backend(QObject *parent = nullptr);

    void registerQmlCreatableObjects();//QQmlContext *rootContext);

    Q_INVOKABLE int registerViewController(ViewController* viewController);
    // Q_INVOKABLE int registerSwitchController(SwitchViewController* endstationController);

private:
    int m_controllerCounter = 0;
    QMap<int, ViewController*> m_viewController;

signals:
};
typedef Singleton<Backend> main_backend;

#endif // BACKEND_H
