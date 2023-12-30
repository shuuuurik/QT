import QtQuick
import QtPositioning
import QtLocation
import QtQuick.Controls
import "assets"

Page {
    width: 640
    height: 480
    PositionSource {
        id: positionSource
        updateInterval: 1000
        name: "nmea"
        PluginParameter { name: "nmea.source"; value: "Lab11/nmea/path.nmea" }
        active: true
    }
    Map {
        id: map
        // ToDo: bind zoomLevel property to slider value
        zoomLevel: slider.value
        anchors.fill: parent

        // ToDo: define plugin to work with OSM
        plugin: Plugin {
            allowExperimental: true
            name: "osm"
            required.mapping: Plugin.AnyMappingFeatures
            required.geocoding: Plugin.AnyGeocodingFeatures
        }
        
        // ToDo: add binding of the map center to the position coordinate
        Binding {
            target: map
            property: "center"
            value: positionSource.position.coordinate
            when: positionSource.position.coordinate.isValid
        }

        // ToDo: create MouseArea to handle clicks and holds

        // ToDo: add item at the current position
        Component.onCompleted: {
            center = QtPositioning.coordinate(55.751244, 37.618423)
            map.addMapItem(footprints)
        }
    }
    // ToDo: add a slider to control zoom level
    Slider {
        id: slider
        from: map.minimumZoomLevel
        to: map.maximumZoomLevel
        value: 11
    }

    // ToDo: add a component corresponding to MapQuickCircle
    Footprints {
        id: footprints
        visible: positionSource.position.coordinate.isValid
        coordinate: positionSource.position.coordinate
        diameter: Math.min(map.width, map.height) / 8
    }
}
