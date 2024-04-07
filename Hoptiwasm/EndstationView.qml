import QtQuick
import QtQuick.Layouts
import Hoptiwasm

EndstationViewController {
    id:controller
    property alias talaState: controller.state

    connectionDragActive: conMechanism.connectionDragInProgress
    connectionDragStart:conMechanism.connectionDragStart
    connectionDragPosition: conMechanism.connectionDragPosition

    Component.onCompleted: {
        controllerId = _mbackend.registerViewController(controller)
        // _mbackend.registerEndstationViewController(controller);
    }

    required property bool canMove
    property real textSize : 24

    listenerLabelText: "L1" //listenerLabel.text
    talkerLabelText: "T1" //talkerLabel.text

    property bool listenerRowVisible: true
    property bool talkerRowVisible: true

    property bool latencyOk: true
    property real talkerLatency: 0.25
    property int talkerStreamSize: 4
    property int listenerStreamSize: 4

    Rectangle {
        id:contentRect
        color: "white"
        border.width: 2
        border.color: "black"

        property real tMargins:5

        // anchors.left:parent
        // anchors.fill: parent

        // height: 20
        // width: 60
        implicitWidth: rowboat.width
        implicitHeight: rowboat.height

        Rectangle {
            color: "lightgrey"
            anchors.fill: rowboat
            border.width: 2
            border.color: "black"
            anchors.margins: border.width * -1
            // height: labelGrid.implicitHeight
            // width: labelGrid.implicitWidth
        }
        RowLayout {
            id: rowboat
            // Rectangle {
            height: labelGrid.implicitHeight
            spacing:1


            GridLayout {
                // Column {
                id: labelGrid
                columns: 2
                rows: listenerRowVisible + talkerRowVisible
                // padding: 10
                // spacing: 10
                columnSpacing: 1
                rowSpacing: 1
                // uniformCellHeights: true
                // uniformCellWidths: true
                Rectangle {
                    id: listenerLabelRect
                    visible: listenerRowVisible

                    color: "white"
                    height: listenerLabel.implicitHeight
                    width: height //listenerLabel.implicitWidth

                    Text {
                        id: listenerLabel
                        font.pointSize: controller.textSize
                        font.bold: true
                        horizontalAlignment: Text.Center
                        anchors.centerIn: parent
                        text: controller.listenerLabelText
                    }
                }
                Rectangle {
                    id: listenerIconRect
                    visible: listenerRowVisible

                    color: "white"
                    height: listenerLabelRect.height
                    width: listenerLabelRect.width

                    Image {
                        id: listenerIcon
                        source: "qrc:images/Listener.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.fill: parent
                        anchors.margins: 2
                    }
                }
                Rectangle {
                    id: talkerLabelRect
                    visible: talkerRowVisible

                    color: "white"
                    height: talkerLabel.implicitHeight
                    width: height //listenerLabel.implicitWidth

                    Text {
                        id: talkerLabel
                        font.pointSize: controller.textSize
                        font.bold: true
                        horizontalAlignment: Text.Center
                        anchors.centerIn: parent
                        text: controller.talkerLabelText
                        // anchors.bottom: root.bottom
                        // anchors.left: root.left
                        // anchors.margins: root.tMargins
                    }
                }
                Rectangle {
                    id: talkerIconRect
                    visible: talkerRowVisible

                    color: "white"
                    height: talkerLabelRect.height
                    width: talkerLabelRect.width
                    Image {
                        id: talkerIcon
                        source: "qrc:images/Talker.svg"
                        // sourceSize.width: 200
                        // sourceSize.height: 200
                        height: talkerLabel.height
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
            Rectangle {
                id: connectionSpeedRect
                property bool speedyGonzales: true
                color: speedyGonzales ? "#6FB558" : "#E7584E"
                implicitWidth: connectionSpeedText.width
                implicitHeight: labelGrid.implicitHeight
                Text {
                    id: connectionSpeedText
                    anchors.verticalCenter: connectionSpeedRect.verticalCenter
                    anchors.left: connectionSpeedRect.left
                    font.bold: true
                    text: connectionSpeedRect.speedyGonzales ?  "1G" : "100mb"
                    font.pointSize: controller.textSize
                }
            }
            Rectangle {
                id: whateverNRis
                color: "#6FB558"
                implicitWidth: whateverNRisLabel.width
                implicitHeight: labelGrid.implicitHeight
                Text {
                    id: whateverNRisLabel
                    anchors.verticalCenter: whateverNRis.verticalCenter
                    anchors.left: whateverNRis.left
                    font.bold: true
                    text: "NR"
                    font.pointSize: controller.textSize
                }
            }
            ColumnLayout {
                spacing: 1

                Rectangle {
                    id: latencySettingsRect
                    visible: controller.talkerRowVisible

                    color: controller.latencyOk ? "#6FB558" : "#E7584E"
                    implicitHeight: listenerLabelRect.height
                    width: controller.talkerRowVisible ?  latencySettingsText.implicitWidth : 0
                    Text {
                        id: latencySettingsText
                        font.pointSize: controller.textSize
                        font.bold: true
                        text: controller.talkerLatency.toFixed(2)+"ms"
                    }
                }
                Rectangle {
                    id: placeHolderRect
                    visible: controller.listenerRowVisible
                    color: "white"
                    implicitHeight: latencySettingsRect.height
                    implicitWidth: controller.talkerRowVisible ? latencySettingsRect.width : 40
                    // width:
                }
            }
            ColumnLayout {
                spacing: 1

                Rectangle {
                    id: talkerStreamSizeRect
                    color: "white"
                    visible: controller.talkerRowVisible

                    implicitHeight: listenerLabelRect.height
                    width: talkerStreamSizeLabbel.implicitWidth

                    Text {
                        id: talkerStreamSizeLabbel
                        font.bold: true
                        font.pointSize: controller.textSize
                        text: controller.talkerStreamSize.toString().padStart(2,'0')+"CH"
                    }
                }
                Rectangle {
                    id: listenerStreamSizeRect
                    color: "white"
                    visible: controller.listenerRowVisible

                    implicitHeight: listenerLabelRect.height
                    width: talkerStreamSizeLabbel.implicitWidth

                    Text {
                        id: listenerStreamSizeLabbel
                        font.bold: true
                        font.pointSize: controller.textSize
                        text: controller.listenerStreamSize.toString().padStart(2,'0')+"CH"
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: contentRect
            drag.target: controller
            enabled: controller.canMove
        }
        // MouseArea {
        //     anchors.fill: contentRect
        //     enabled: !controller.canMove
        //     hoverEnabled: true
        //     onEntered: console.log("entered", controller.controllerId)
        //     propagateComposedEvents: true
        //     preventStealing: false
        // }

        ConnectionMechanism {
            id: conMechanism
            controllerId: controller.controllerId
            dragAllowed: !controller.canMove
            dropAllowance: !controller.canMove
            anchors.fill: parent
            // rootViewItemX: 2//controller.parent
        }


    }
    states: [
        State {
            name: "talker"
            PropertyChanges {target: controller; listenerRowVisible: false}
            PropertyChanges {target: controller; talkerRowVisible: true}

        },
        State {
            name: "listener"
            PropertyChanges {target: controller; listenerRowVisible: true}
            PropertyChanges {target: controller; talkerRowVisible: false}
        },
        State {
            name: "combined"
            PropertyChanges {target: controller; listenerRowVisible: true}
            PropertyChanges {target: controller; talkerRowVisible: true}
        }
    ]

}
