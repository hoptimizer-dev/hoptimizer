import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    color: "darkgrey"

    Text {
        id: mumiu
        text: qsTr("Hopfen optimizer")
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 20
    }
}
