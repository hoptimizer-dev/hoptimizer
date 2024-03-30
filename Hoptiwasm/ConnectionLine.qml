import QtQuick
import QtQuick.Shapes

Shape {
    z: 2
    property real dragStart: 0
    property real dragEnd: 0
    property bool draggin: false

    property alias endOfline: endOfLine

    visible: draggin
    ShapePath {

        startX: 10
        startY: 10
        strokeColor: "black"
        strokeWidth: 3
        PathLine {
            x: endOfLine.x
            y: endOfLine.y
        }
    }
    Rectangle {
        id: endOfLine
        width: 10
        height: 10

    }
}
