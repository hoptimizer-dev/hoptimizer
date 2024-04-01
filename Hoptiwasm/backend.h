#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QQmlContext>

#include <QMap>

#include "singletonpattern.h"

#include "viewcontroller.h"
#include "endstationviewcontroller.h"

class Backend : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool connectionDragActive READ connectionDragActive WRITE setConnectionDragActive NOTIFY connectionDragActiveChanged FINAL)
    Q_PROPERTY(QPointF connectionDragStart READ connectionDragStart WRITE setConnectionDragStart NOTIFY connectionDragStartChanged FINAL)
    Q_PROPERTY(QPointF connectionDragPosition READ connectionDragPosition WRITE setConnectionDragPosition NOTIFY connectionDragPositionChanged FINAL)

    Q_PROPERTY(int connectionTargetId READ connectionTargetId WRITE setConnectionTargetId NOTIFY connectionTargetIdChanged FINAL)

    Q_PROPERTY(QQuickItem* rootViewPointer READ rootViewPointer WRITE setRootViewPointer NOTIFY rootViewPointerChanged FINAL)

public:
    explicit Backend(QObject *parent = nullptr);

    void registerQmlCreatableObjects();//QQmlContext *rootContext);

    Q_INVOKABLE int registerViewController(ViewController* viewController);

    Q_INVOKABLE void tryConnectionFromSourceId(int sourceId);

    bool connectionDragActive() const;
    void setConnectionDragActive(bool newConnectionDragActive);

    int connectionTargetId() const;
    void setConnectionTargetId(int newConnectionTarget);

    QPointF connectionDragStart() const;
    void setConnectionDragStart(QPointF newConnectionDragStart);

    QPointF connectionDragPosition() const;
    void setConnectionDragPosition(QPointF newConnectionDragPosition);

    QQuickItem *rootViewPointer() const;
    Q_INVOKABLE void setRootViewPointer(QQuickItem *newRootView);

private:
    int m_controllerCounter = 0;
    QMap<int, ViewController*> m_viewController;

    bool m_connectionDragActive;

    void setControllerSignalSlotConnections(ViewController* viewController);

    int m_connectionTargetId = -1;

    QPointF m_connectionDragStart = QPointF(0,0);

    QPointF m_connectionDragPosition = QPointF(0,0);

    QQuickItem *m_rootViewPointer = nullptr;

    QQuickItem *m_activeConnectionDragger = nullptr;

signals:
    void connectionDragActiveChanged();
    void connectionTargetIdChanged();
    void connectionDragStartChanged();
    void connectionDragPositionChanged();
    void rootViewPointerChanged();

    void createConenction(int fromId, int toId);
};
typedef Singleton<Backend> main_backend;

#endif // BACKEND_H
