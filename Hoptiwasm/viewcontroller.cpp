#include "viewcontroller.h"
#include <QDebug>

ViewController::ViewController() {}

int ViewController::controllerId() const
{
    return m_controllerId;
}

void ViewController::setControllerId(int newControllerId)
{
    if (m_controllerId == newControllerId)
        return;
    // qDebug() << "My ID " <<  newControllerId;
    m_controllerId = newControllerId;
    emit controllerIdChanged();
}

bool ViewController::connectionDragActive() const
{
    return m_connectionDragActive;
}

void ViewController::setConnectionDragActive(bool newConnectionDragActive)
{
    if (m_connectionDragActive == newConnectionDragActive)
        return;
    m_connectionDragActive = newConnectionDragActive;
    // qDebug() << "emit dragStart" << controllerId();
    emit connectionDragActiveChanged(newConnectionDragActive);
}

QPoint ViewController::connectionDragStart() const
{
    return m_connectionDragStart;
}

void ViewController::setConnectionDragStart(QPoint newConnectionDragStart)
{
    if (m_connectionDragStart == newConnectionDragStart)
        return;
    m_connectionDragStart = newConnectionDragStart;
    emit connectionDragStartChanged(newConnectionDragStart);
}

QPoint ViewController::connectionDragPosition() const
{
    return m_connectionDragPosition;
}

void ViewController::setConnectionDragPosition(QPoint newConnectionDragPosition)
{
    if (m_connectionDragPosition == newConnectionDragPosition)
        return;
    m_connectionDragPosition = newConnectionDragPosition;
    emit connectionDragPositionChanged(newConnectionDragPosition);
}
