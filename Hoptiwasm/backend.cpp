 #include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::registerQmlCreatableObjects()//QQmlContext *rootContext)
{
    qmlRegisterType<ViewController>("Hoptiwasm", 1, 0, "ViewController");
    qmlRegisterType<EndstationViewController>("Hoptiwasm", 1, 0, "EndstationViewController");
}

int Backend::registerViewController(ViewController *viewController)
{
    int currentCount = ++m_controllerCounter;
    m_viewController.insert(currentCount, viewController);

    setControllerSignalSlotConnections(viewController);

    return currentCount;
}

void Backend::setControllerSignalSlotConnections(ViewController *viewController)
{
    connect(viewController, &ViewController::connectionDragActiveChanged, this, &Backend::setConnectionDragActive);
    connect(viewController, &ViewController::connectionDragStartChanged, this, &Backend::setConnectionDragStart);
    connect(viewController, &ViewController::connectionDragPositionChanged, this, &Backend::setConnectionDragPosition);
}

void Backend::tryConnectionFromSourceId(int sourceId)
{
    qDebug() << "Connection attempt" << sourceId << connectionTargetId();
    emit createConenction(sourceId, connectionTargetId());
}


bool Backend::connectionDragActive() const
{
    return m_connectionDragActive;
}

void Backend::setConnectionDragActive(bool newConnectionDragActive)
{
    // qDebug() << "who did this" << sender() << newConnectionDragActive;

    if (m_connectionDragActive == newConnectionDragActive)
        return;
    if(newConnectionDragActive) {
        m_activeConnectionDragger = qobject_cast<QQuickItem*>( sender());
        setConnectionDragStart(connectionDragStart());
        setConnectionDragPosition(connectionDragPosition());
    }
    else {
        m_activeConnectionDragger = nullptr;
    }
    m_connectionDragActive = newConnectionDragActive;
    emit connectionDragActiveChanged();
}

int Backend::connectionTargetId() const
{
    return m_connectionTargetId;
}

void Backend::setConnectionTargetId(int newConnectionTarget)
{
    if (m_connectionTargetId == newConnectionTarget)
        return;
    m_connectionTargetId = newConnectionTarget;
    emit connectionTargetIdChanged();
}

QPointF Backend::connectionDragStart() const
{
    return m_connectionDragStart;
}

void Backend::setConnectionDragStart(QPointF newConnectionDragStart)
{

    // if (m_connectionDragStart == newConnectionDragStart)
    //     return;
    if(m_activeConnectionDragger)
    {
        m_connectionDragStart = m_rootViewPointer->mapFromItem(m_activeConnectionDragger, newConnectionDragStart);//m_activeConnectionDragger->mapToItem(newConnectionDragStart, newConnectionDragStart);
        emit connectionDragStartChanged();
    }
    else {
        m_connectionDragStart = newConnectionDragStart;
    }
    // qDebug() << "connection drag start" << m_connectionDragStart;
}

QPointF Backend::connectionDragPosition() const
{
    return m_connectionDragPosition;
}

void Backend::setConnectionDragPosition(QPointF newConnectionDragPosition)
{
    if (m_connectionDragPosition == newConnectionDragPosition)
        return;
    if(m_activeConnectionDragger)
    {
        m_connectionDragPosition = m_rootViewPointer->mapFromItem(m_activeConnectionDragger, newConnectionDragPosition);
        emit connectionDragPositionChanged();
    }
    else {
        m_connectionDragPosition = newConnectionDragPosition;
    }
}

QQuickItem *Backend::rootViewPointer() const
{
    return m_rootViewPointer;
}

void Backend::setRootViewPointer(QQuickItem *newRootView)
{
    if (m_rootViewPointer == newRootView)
        return;
    m_rootViewPointer = newRootView;
    qDebug() << "we have a root view" << newRootView;
    emit rootViewPointerChanged();
}
