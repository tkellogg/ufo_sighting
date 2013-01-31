

$(function() {
	var mapOptions = {
		center: new google.maps.LatLng(-34.397, 150.644),
		zoom: 8,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map_canvas"),
			mapOptions);

	$.getJSON('sightings.json', null, function(data) {

		for (var i in data) {
			var sighting = data[i];
			var myLatlng = new google.maps.LatLng(sighting.coord_lat, sighting.coord_lon);
			var marker = new google.maps.Marker({
					position: myLatlng,
					map: map,
					title: sighting.summary
			});
		}

	});
});
