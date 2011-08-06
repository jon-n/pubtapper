// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var map;
var markersArray = [];
var infowindow = null;

$(document).ready(function() {
	
	if ($('#map_canvas').length) {

		/* CREATE THE MAP */
		var latlng = new google.maps.LatLng(37.424397, -122.141017);
		var myOptions = {
			  zoom: 12,
			  center: latlng,
			  mapTypeId: google.maps.MapTypeId.ROADMAP,
			  mapTypeControlOptions: {
				style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
				},
			  scrollwheel: false,
			  zoomControl: true,
			  zoomControlOptions: {
				style: google.maps.ZoomControlStyle.SMALL
				}
			};
		
		map = new  google.maps.Map(document.getElementById('map_canvas'),myOptions);
		
		infowindow = new google.maps.InfoWindow({
			content: "loading...",
			maxWidth:200
		});
		
		/* GET STUFF TO PLOT ON THE MAP */
		
		// use direct ajax instead of jQuery getJSON method so we can tell it not to cache the json
		// json caching causes problems in Chrome/FF when going back to the page (renders cached json instead)
		$.ajax({
			type: "GET",
			url: window.location.href,
			success: function (json) {
				
				if (json.length > 0) {
					/*
					latlng2 = new google.maps.LatLng(json[0].place.latitude, json[0].place.longitude);
				
					map.setCenter(latlng2);
					*/
					var mapcenter = false;
					
					for (i=0; i < json.length; i++) {
					
						if (mapcenter == false) {
							if (json[i].place.latitude  && json[i].place.longitude && json[i].place.latitude != 0 && json[i].place.longitude != 0) {
								latlng2 = new google.maps.LatLng(json[i].place.latitude, json[i].place.longitude);
								map.setCenter(latlng2);
								mapcenter = true;
							}
						}
					
						var listitem = json[i].place;
						
						addPlace(listitem);
						
					}		
				}
			},
			dataType: "json",
			cache: false
		});
	}
});

/* UNLOAD GOOGLE MAP */

$(window).unload(function() {

	if (markersArray) {
		for (i in markersArray) {
			markersArray[i].setMap(null);
		}
		markersArray.length = 0;
	}
		
	if (map) {
		map = null;
	}

	//return false;
});