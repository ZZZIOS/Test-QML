import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0 // для готовых элементов пользовательского интерфейса

Window {
    visible: true
    width: 600
    height: 400
    title: qsTr("Test QML programm")

    Text{
        id: mainLabel
        anchors.centerIn: parent
        text: "main window label"
    }

    Rectangle{
        id: button1
        color: "blue"
        width: parent.width / 4 // связывание свойств
        height: parent.height / 20
        x: parent.width / 5
        y: parent.height / 4

        onWidthChanged:
            console.log("W changed");
        onHeightChanged:
            console.log("H changed");

        // собственные свойства

        property int tapCouter: 0
        property bool condition1: false

        onCondition1Changed: {
            color = "yellow";
        }

        Text{
            id: buttonLabel
            anchors.centerIn: parent
            text: parent.tapCouter
        }

        MouseArea{

                 id: buttonMouseArea
                 anchors.fill: parent
                 acceptedButtons: Qt.LeftButton | Qt.RightButton

                 onClicked: {
                     parent.tapCouter++;
                     if (mouse.button == Qt.RightButton)
                         parent.color = "green";
                     else
                         parent.color = "red";

                     if(parent.tapCouter % 5 == 0){
                         if(parent.condition1 == false)
                             parent.condition1 = true;
                         else
                             parent.condition1 = false;
                     }
                 }
        }
    }
    Button{
        x: parent.width / 4 + parent.width / 5 + parent.width / 30
        y: parent.height / 4
        width: parent.width / 4
        height: parent.height / 20
        text: "I'm a button, tap me"
    }
}
