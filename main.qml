import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Test QML programm")

    Text{
        id: mainLabel
        anchors.centerIn: parent
        text: "main window label"
    }

    Rectangle{
        id: button1
        color: "blue"
        width: 200
        height: 200

        Text{
            x: 200
            y: 100
            id: buttonLabel
            anchors.centerIn: parent
            text: "click me"
        }

        MouseArea{

                 id: buttonMouseArea
                 anchors.fill: parent //прикрепим все стороны области мыши к якорям прямоугольника
                         //onClicked обработает корректные щелчки кнопки мыши
                 acceptedButtons: Qt.LeftButton | Qt.RightButton

                 onClicked: {
                     // console.log(buttonLabel.text + " clicked" )
                     if (mouse.button == Qt.RightButton)
                         parent.color = 'blue';
                     else
                         parent.color = 'red';
                 }
        }
    }
}
