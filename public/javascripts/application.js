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
					latlng2 = new google.maps.LatLng(json[0].game.venue.latitude, json[0].game.venue.longitude);
				
					map.setCenter(latlng2);
					*/
					var mapcenter = false;
					
					for (i=0; i < json.length; i++) {
					
						if (mapcenter == false) {
							if (json[i].game.venue.latitude  && json[i].game.venue.longitude && json[i].game.venue.latitude != 0 && json[i].game.venue.longitude != 0) {
								latlng2 = new google.maps.LatLng(json[i].game.venue.latitude, json[i].game.venue.longitude);
								map.setCenter(latlng2);
								mapcenter = true;
							}
						}
					
						var game = json[i].game;
						
						addPlace(game);
						
					}		
				}
			},
			dataType: "json",
			cache: false
		});
	}
	
	function addPlace(game) {
		var latlng = new google.maps.LatLng(game.venue.latitude,game.venue.longitude);
		
		// construct infowindow content
		
		var createdate = new Date(game.created_at);
		//createdate.format("m/dd/yy");
		
		var contentstring = 
			'<div class="infowindow-content"><a href="/games/' + game.id + '"><b>' + game.title + '</b></a><br />' + game.venue.address +
			//'<br />Added: ' + createdate.getDate();
			'<br />Added: ' + $.datepicker.formatDate('m/dd/yy',createdate) + '</div>'
			;
			
		var marker = new google.maps.Marker({
			position: latlng,
			map:map,
			content: contentstring
			
		});
		
		// add marker to marker array
		markersArray.push(marker);
		
		/* construct infowindow */
		
		google.maps.event.addListener(marker,'click',function() {
			infowindow.setContent(this.content);
			infowindow.open(map,this);
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