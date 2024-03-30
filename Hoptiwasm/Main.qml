import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Window {
    // width: 640
    // height: 480
    minimumWidth: 640
    minimumHeight: 800
    visible: true
    title: qsTr("HophopHopfen")

    color: "darkgrey"

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

        // onDragAreaDragChanged: {console.log("dragdrag"); dragginSwitch.visible = dragAreaDrag}

        // dragTarget: conLine.endOfline

        // connectionDummyStart: conLine.dragStart
        // conenctionDummyEnd:conLine.dragEnd

        // onDragginChanged: (draggin)  => conLine.draggin =  draggin
    }
    Rectangle {
        id: dragginSwitch
        width: 20
        height: 20
        color: "red"
        z: 2
        visible: false //avbSwitch.dragArea.drag
    }

    TalkerListenerView {
        x:200
        y:200
        talaState: "combined"
        latencyOk: false
        talkerLabelText: "T2"
        canMove: !connectButton.checked
    }

    TalkerListenerView {
        x: 200
        y: 400
        talaState: "talker"
        talkerLatency: 2
        canMove: !connectButton.checked
    }
    TalkerListenerView {
        x: 200
        y: 600
        talaState: "listener"
        listenerLabelText: "2"
        canMove: !connectButton.checked
    }

    Component.onCompleted: console.log("xxx")

    ConnectionLine
    {
        id: conLine

        // visible: false
    }

    Rectangle {
        DropArea {

        }
    }
    // Column {
    //     Rectangle {
    //         width: 40
    //         height: 40
    //         color: "blue"
    //     }
    //     Rectangle {
    //         width: 40
    //         height: 40
    //         color: "red"
    //     }
    //     Rectangle {
    //         width: 40
    //         height: 40
    //         color: "yellow"
    //         visible: false
    //     }
    //     Rectangle {
    //         width: 40
    //         height: 40
    //         color:"#6FB558"//Qt.rgba(102/255,188/255,96/255, 1	)// "green"
    //     }
    // }

}
