var json = [
	{
		city: 'Moundville',
		state: 'AL',
		date_time: '1/18/03 02:30',
		summary: "this is the third time i have seen these objects in less than a month in this area after the first time i was so scared that i wasn't s",
		coord_lon: -87.623444,
		coord_lat: 32.997286
	}
];

function SightingMap(map) {
	this.map = map;
};

SightingMap.prototype.load_data = function (data) {
		for (var i in data) {
			var sighting = data[i];
			var myLatlng = new google.maps.LatLng(sighting.coord_lat, sighting.coord_lon);
			console.log (sighting);
			var marker = new google.maps.Marker({
					position: myLatlng,
					map: this.map,
					title: sighting.summary
			});
		}
};

var load = function(position) {
	var lat = position.coords.latitude,
		lon = position.coords.longitude;

	var mapOptions = {
		center: new google.maps.LatLng(lat, lon),
		zoom: 8,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map_canvas"),
			mapOptions);
	var sightingMap = new SightingMap(map);

	var url = 'http://timkellogg.me/ufo_sighting/sightings.json';
	//$.getJSON(url, null, function(data) { sightingMap.load_data.apply(sightinMap, data); });
	sightingMap.load_data(json);
}

$(function() {
	if (!navigator.geolocation.getCurrentPosition(load)) {
		alert("geolocation isn't working");
	}
});
