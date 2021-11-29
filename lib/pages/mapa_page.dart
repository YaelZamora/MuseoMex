import 'package:day21/lists/lat_long_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapaPage extends StatelessWidget {
  MapaPage({
    Key? key,
    required this.latitud,
    required this.longitud,
  }) : super(key: key);

  final double latitud;
  final double longitud;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(latitud, longitud),
          zoom: 15,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/yaelzamora/ckwjzugrz2jy115o0so7ipd1c/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoieWFlbHphbW9yYSIsImEiOiJja3cydDJ4eWgwZmxmMnFtbmswNHJweGE1In0.AUfal4zjfWtOxr6yR_0ELg',
            additionalOptions: {
              'accesToken':
                  'pk.eyJ1IjoieWFlbHphbW9yYSIsImEiOiJja3cydDJ4eWgwZmxmMnFtbmswNHJweGE1In0.AUfal4zjfWtOxr6yR_0ELg',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                point: latLng.LatLng(latitud, longitud),
                builder: (BuildContext context) => const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
