import QtQuick
import QtQuick.Controls
import Hoptiwasm


// SwitchViewController {
ViewController {
    required property bool connectButtonChecked

    connectionDragActive: conMechanism.connectionDragInProgress
    connectionDragStart:conMechanism.connectionDragStart
    connectionDragPosition: conMechanism.connectionDragPosition
    Component.onCompleted: controllerId = _mbackend.registerViewController(controller)

    width: 100
    height: 100

    id: controller
    Rectangle {
        color: "white"
        anchors.fill: controller

        border.width: 4
        border.color: "black"
        radius: 4

        Image {
            anchors.fill: parent
            anchors.margins: 8
            id: icon
            source: "qrc:images/Switch.svg"
            sourceSize.width: parent.width * 2
            sourceSize.height: parent.height * 2
            fillMode: Image.PreserveAspectFit
        }
        MouseArea {
            id: moveObjectMouseArea
            anchors.fill: parent
            drag.target: controller
            enabled: !connectButtonChecked//connectButton.checked
        }

        ConnectionMechanism {
            id:conMechanism
            anchors.fill: parent
            controllerId: controller.controllerId
            dragAllowed: connectButtonChecked
            dropAllowance: connectButtonChecked
            // rootViewItemX: 2//controller.parent
        }
    }

}
