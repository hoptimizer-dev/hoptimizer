#ifndef ENDSTATIONVIEWCONTROLLER_H
#define ENDSTATIONVIEWCONTROLLER_H

#include <QQmlEngine>
#include "viewcontroller.h"
// #include <QString>

class EndstationViewController : public ViewController
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString listenerLabelText READ listenerLabelText WRITE setListenerLabelText NOTIFY listenerLabelTextChanged FINAL)
    Q_PROPERTY(QString talkerLabelText READ talkerLabelText WRITE setTalkerLabelText NOTIFY talkerLabelTextChanged FINAL)

public:
    EndstationViewController();
    QString listenerLabelText() const;
    void setListenerLabelText(const QString &newListenerLabelText);
    QString talkerLabelText() const;
    void setTalkerLabelText(const QString &newTalkerLabelText);

signals:
    void listenerLabelTextChanged();
    void talkerLabelTextChanged();

private:
    QString m_listenerLabelText;
    QString m_talkerLabelText;
};

#endif // ENDSTATIONVIEWCONTROLLER_H
