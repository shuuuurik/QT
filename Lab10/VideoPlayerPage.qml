import QtQuick
import QtMultimedia
import QtQuick.Controls

Item {
    id: it
    width: 640
    height: 480
    Column {
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        MediaPlayer {
            id: mediaPlayer
            source: "soundeffects/cats.mp4"
            audioOutput: AudioOutput {
                volume: 0.1
            }
            videoOutput: videoOutput
        }

        VideoOutput {
            id: videoOutput
            width: parent.width
            height: 200
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(mediaPlayer.playbackState == 1)
                        mediaPlayer.pause()
                    else
                        mediaPlayer.play()
                }
            }
        }
        // ToDo: add button to start video
        Button {
            id: button
            width: parent.width
            height: 30
            text: "Play"
            onClicked: mediaPlayer.play()
        }

        // ToDo: add silder to control playback
        Slider {
            id: videoSlider
            width: it.width
            enabled: mediaPlayer.seekable
            to: 1.0
            value: mediaPlayer.position / mediaPlayer.duration
            onMoved: mediaPlayer.setPosition(value * mediaPlayer.duration)
        } 
    }
}
