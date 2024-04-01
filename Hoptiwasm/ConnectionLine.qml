import QtQuick
import QtQuick.Shapes

Shape {
    z: 10
    id:root
    required property point lineStart//: 0
    // onDragStartChanged: console.log("line start", lineStart)
    required property point lineEnd//: 0
    required property bool shouldBeVisible//: false

    property real connectionLineEdgeSize: 10

    visible: shouldBeVisible
    ShapePath {
        id: connectionPath
        startX: lineStart.x
        // onStartXChanged: console.log("stratx", startX)
        startY: lineStart.y
        strokeColor: "black"
        strokeWidth: 3
        PathLine {

            x: root.lineEnd.x
            y: root.lineEnd.y
        }
    }
    Rectangle {
        id:startOfLine
        x: root.lineStart.x-radius
        y: root.lineStart.y-radius
        width: connectionLineEdgeSize
        height: connectionLineEdgeSize
        radius: connectionLineEdgeSize/2
        color:"black"
    }

    Rectangle {
        id: endOfLine
        x: lineEnd.x-radius
        y: lineEnd.y-radius
        width: connectionLineEdgeSize
        height: connectionLineEdgeSize
        radius: connectionLineEdgeSize/2
        color: "black"
    }
}
