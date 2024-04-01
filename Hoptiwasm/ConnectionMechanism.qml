import QtQuick
import QtQuick.Controls

Item {
    required property int controllerId
    required property bool dragAllowed
    required property bool dropAllowance

    property bool connectionDragInProgress: draggy.drag.active
    property point connectionDragStart: Qt.point(0,0)
    property point connectionDragPosition: Qt.point(draggy.mouseX, draggy.mouseY)

    id:root
    anchors.fill: parent
    z: connectionDragInProgress ? 2 : 0

    DropArea {
        id: droppy
        property int controllerId: root.controllerId
        anchors.fill: root
        enabled: root.dropAllowance
        keys: ["con"]
        // onContainsDragChanged: {
        //     if(droppy.containsDrag )
        //     {
        //         console.log("you could drop")
        //     }
        //     else {
        //         console.log("not anymore")
        //     }
        // }
    }
    // Rectangle {
    //     color: "yellow"
    //     anchors.fill: droppy
    // }

    MouseArea {
        id: draggy
        anchors.fill: parent

        enabled: root.dragAllowed

        drag.target: draggableItem
        drag.smoothed: false

        onReleased: _mbackend.tryConnectionFromSourceId(root.controllerId)
        onPressed: {
            draggableItem.Drag.hotSpot.x = mouseX
            draggableItem.Drag.hotSpot.y = mouseY
            root.connectionDragStart.x = mouseX
            root.connectionDragStart.y = mouseY
        }

        Item {
            // color: "#33ff0340"
            id: draggableItem
            property int wantsConnectionToId: -1
            property int comingFromId: root.controllerId
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            width: parent.width
            height: parent.height

            Drag.hotSpot.x: width/2
            Drag.hotSpot.y: height/2

            Drag.keys: ["con"]

            Drag.active: draggy.drag.active

            Drag.onTargetChanged: {
                if(Drag.target) {
                    // console.log("target", Drag.target)
                    _mbackend.connectionTargetId = Drag.target.controllerId
                }
                else {
                    _mbackend.connectionTargetId = -1
                }
            }

            states: State {
                when: draggy.drag.active
                AnchorChanges {
                    target: draggableItem
                    anchors.horizontalCenter: undefined
                    anchors.verticalCenter: undefined

                }
            }
        }
    }
}
