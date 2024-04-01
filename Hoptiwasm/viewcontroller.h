#ifndef VIEWCONTROLLER_H
#define VIEWCONTROLLER_H

#include <QQuickItem>
#include <QPoint>

class ViewController : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(int controllerId READ controllerId WRITE setControllerId NOTIFY controllerIdChanged FINAL)

    Q_PROPERTY(bool connectionDragActive READ connectionDragActive WRITE setConnectionDragActive NOTIFY connectionDragActiveChanged FINAL)
    Q_PROPERTY(QPoint connectionDragStart READ connectionDragStart WRITE setConnectionDragStart NOTIFY connectionDragStartChanged FINAL)
    Q_PROPERTY(QPoint connectionDragPosition READ connectionDragPosition WRITE setConnectionDragPosition NOTIFY connectionDragPositionChanged FINAL)

public:
    ViewController();

    int controllerId() const;
    void setControllerId(int newControllerId);

    bool connectionDragActive() const;
    void setConnectionDragActive(bool newConnectionDragActive);

    QPoint connectionDragStart() const;
    void setConnectionDragStart(QPoint newConnectionDragStart);

    QPoint connectionDragPosition() const;
    void setConnectionDragPosition(QPoint newConnectionDragPosition);

signals:
    void controllerIdChanged();
    void connectionDragActiveChanged(bool active);

    void connectionDragStartChanged(QPoint startPoint);

    void connectionDragPositionChanged(QPoint connectionPosition);

private:
    int m_controllerId;
    bool m_connectionDragActive;
    QPoint m_connectionDragStart;
    QPoint m_connectionDragPosition;
};

#endif // VIEWCONTROLLER_H
