#ifndef VIEWCONTROLLER_H
#define VIEWCONTROLLER_H

#include <QQuickItem>

class ViewController : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int controllerId READ controllerId WRITE setControllerId NOTIFY controllerIdChanged FINAL)
public:
    ViewController();

    int controllerId() const;
    void setControllerId(int newControllerId);

signals:
    void controllerIdChanged();
private:
    int m_controllerId;
};

#endif // VIEWCONTROLLER_H
