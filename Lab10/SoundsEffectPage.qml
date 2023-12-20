import QtQuick
import QtMultimedia
import QtQuick.Controls

Item {
    width: 640
    height: 480
    SoundEffect {
        id: soundEffect
        // ToDo: set source to gun.wav in soundeffects folder
        source: "soundeffects/gun.wav"
        // ToDo: set volume controlled by volumeSlider
        volume: volumeSlider.value
        // ToDo: set loops controlled by slider
        loops: timesSlider.value
    }
    MouseArea {
        id: touchHandler
        anchors.fill: parent
        // ToDo: play sound effect or stop playing on clicked
        onClicked: {
            (soundEffect.playing) ? soundEffect.stop() : soundEffect.play()
        }    
    }
    Column {
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        spacing: 50
        
        Column {
            width: parent.width
            spacing: 20

            Label {
                text: "Volume mixer"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Slider {
                id: volumeSlider
                width: parent.width
                value: 0.5
                from: 0
                to: 1
                stepSize: 0.1
            }
        }

        Column {
            width: parent.width
            spacing: 20

            Label {
                text: "Loops mixer"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // ToDo: add slider to control count of loops
            Slider {
                id: timesSlider
                snapMode: Slider.SnapAlways
                width: parent.width
                value: 2
                from: 1
                to: 10
                stepSize: 1
            }
        }

        Column {
            width: parent.width
            spacing: 20

            Label {
                text: "Progress mixer"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // ToDo: add slider to show progress
            Slider {
                id: timesUserSlider
                enabled: false
                snapMode: Slider.SnapAlways
                width: parent.width
                value: timesSlider.value - soundEffect.loopsRemaining
                from: 1
                to: 10
                stepSize: 1
            }
        }
    }
}
