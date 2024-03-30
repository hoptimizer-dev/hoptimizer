import QtQuick
import QtQuick.Controls
import Hoptiwasm


// SwitchViewController {
ViewController {
    required property bool connectButtonChecked

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
        // DragHandler{
        //     // active: connectButton.checked
        //     enabled: !connectButton.checked
        //     grabPermissions: PointerHandler.TakeOverForbidden
        // }
        MouseArea {
            id: moveObjectMouseArea
            anchors.fill: parent
            drag.target: controller
            enabled: !connectButtonChecked//connectButton.checked
        }

        MouseArea {
            id: connectObjectsMouseArea
            anchors.fill: parent
            // drag.target: root
            enabled: connectButtonChecked//connectButton.checked
            // onClicked: console.log("muuuh")
            drag.onActiveChanged: console.log("mushDrag")
            drag.target: controller.dragTarget

        }


    }


    // Rectangle
    // {

    //     id: con1
    //     width: 20
    //     height: width
    //     anchors.horizontalCenter: parent.left

    //     y: parent.height / 3


    //     radius: width / 2
    //     border.width: 2
    //     border.color: "black"
    //     color: "steelblue"
    // }
}
