import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Window {
    // width: 640
    // height: 480
    id: rootWindow
    minimumWidth: 640
    minimumHeight: 800
    visible: true
    title: qsTr("HophopHopfen")

    color: "darkgrey"

    Connections {
        target: _mbackend
        function onCreateConenction (fromId, toId) {
            console.log("qml was told to create a connection", fromId, toId)

        }
    }

    Item {
        id:firstRootItem
        anchors.fill: parent
        Component.onCompleted: _mbackend.setRootViewPointer(firstRootItem)

        Text {
            id: titletext
            text: qsTr("Hopfen optimizer")
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 20
            font.pointSize: 50
        }
        Button {
            id: connectButton
            checkable: true
            text: "connect"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 10
        }

        AvbSwitchView {
            id: avbSwitch
            x:100
            y:100
            connectButtonChecked: connectButton.checked
        }
        Rectangle {
            id: dragginSwitch
            width: 20
            height: 20
            color: "red"
            z: 2
            visible: false //avbSwitch.dragArea.drag
        }

        EndstationView {
            x:200
            y:200
            talaState: "combined"
            talkerLabelText: "T2"
            listenerLabelText: "L1"
            canMove: !connectButton.checked
        }

        EndstationView {
            x: 200
            y: 400
            talaState: "talker"
            talkerLabelText: "T1"
            // talkerLatency: 2
            canMove: !connectButton.checked
        }
        EndstationView {
            x: 200
            y: 600
            talaState: "listener"
            listenerLabelText: "L2"
            canMove: !connectButton.checked
        }

        ConnectionLine
        {
            id: conLine
            lineStart: _mbackend.connectionDragStart
            lineEnd:_mbackend.connectionDragPosition
            shouldBeVisible:_mbackend.connectionDragActive
        }

        Rectangle {
            DropArea {


            }
        }
    }
}
