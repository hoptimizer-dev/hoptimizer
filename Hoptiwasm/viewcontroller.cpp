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
    qDebug() << "My ID " <<  newControllerId;
    m_controllerId = newControllerId;
    emit controllerIdChanged();
}
