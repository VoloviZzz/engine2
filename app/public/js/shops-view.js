'use strict';

var myMap, myPlacemark;
var fullMap;

$(document).ready(function (e) {
    ymaps.ready(initFullMap);
});

function initFullMap() {
    if ($('#map').length < 1) {
        return false;
    }

    var mapCenterCoords = $('#map').data('center').split(',');

    fullMap = new ymaps.Map("map", {
        center: mapCenterCoords,
        zoom: 16
    });

    myPlacemark = new ymaps.Placemark(mapCenterCoords, {
        hintContent: 'Магазин "Ритуал"'
    });
    fullMap.geoObjects.add(myPlacemark);
}