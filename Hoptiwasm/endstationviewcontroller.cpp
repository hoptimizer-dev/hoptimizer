#include "endstationviewcontroller.h"

EndstationViewController::EndstationViewController() {}

QString EndstationViewController::listenerLabelText() const
{
    return m_listenerLabelText;
}

void EndstationViewController::setListenerLabelText(const QString &newListenerLabelText)
{
    if (m_listenerLabelText == newListenerLabelText)
        return;
    m_listenerLabelText = newListenerLabelText;
    emit listenerLabelTextChanged();
}

QString EndstationViewController::talkerLabelText() const
{
    return m_talkerLabelText;
}

void EndstationViewController::setTalkerLabelText(const QString &newTalkerLabelText)
{
    if (m_talkerLabelText == newTalkerLabelText)
        return;
    m_talkerLabelText = newTalkerLabelText;
    emit talkerLabelTextChanged();
}

