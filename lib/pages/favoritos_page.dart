import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(48.85, 2.34),
          zoom: 13,
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
          )
        ],
      ),
    );
  }
}
