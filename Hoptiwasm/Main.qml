import QtQuick

Window {
    // width: 640
    // height: 480
    minimumWidth: 640
    minimumHeight: 480
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

    Rectangle {
        color: "white"
        width: 140
        height: 140
        Image {
            // width: 140
            // height: 140
            anchors.fill: parent
            anchors.margins: 8
            id: icon
            source: "qrc:images/Switch.svg"
            sourceSize.width: parent.width * 2
            sourceSize.height: parent.height * 2
            fillMode: Image.PreserveAspectFit
        }
        DragHandler{}
        border.width: 4
        border.color: "black"
        radius: 4

        Rectangle
        {

            id: con1
            width: 20
            height: width
            anchors.horizontalCenter: parent.left

            y: parent.height / 3


            radius: width / 2
            border.width: 2
            border.color: "black"
            color: "steelblue"
        }
    }
    Component.onCompleted: console.log("xxx")

}
