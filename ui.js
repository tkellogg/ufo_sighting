var json = [
	{
		city: 'Moundville',
		state: 'AL',
		date_time: '1/18/03 02:30',
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
			var marker = new google.maps.Marker({
					position: myLatlng,
					map: this.map,
					title: sighting.summary
			});
		}
};

$(function() {
	var mapOptions = {
		center: new google.maps.LatLng(32.997286, -87.623444),
		zoom: 8,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map_canvas"),
			mapOptions);
	var sightingMap = new SightingMap(map);

	var url = 'http://timkellogg.me/ufo_sighting/sightings.json';
	//$.getJSON(url, null, function(data) { sightingMap.load_data.apply(sightinMap, data); });
	sightingMap.load_data(json);
});
