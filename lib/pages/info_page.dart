import 'package:day21/lists/costos.dart';
import 'package:day21/lists/imagen.dart';
import 'package:day21/lists/info_complemento.dart';
import 'package:day21/lists/lat_long_list.dart';
import 'package:day21/lists/nombre_museos.dart';
import 'package:day21/src/styles/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong2/latlong.dart' as latLng;

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.nombre,
    required this.posicion,
  }) : super(key: key);
  final String nombre;
  final int posicion;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final List<String> _imagen = imagen;

  final List<double> _costo = costos;

  final Map<String, String> _nombre = museos;
  final Map<double, double> _location = latLongLista;

  final List<String> _horario = horario;

  final _style = Style();

  bool _isSelected = false;
  var valorGuardado;

  @override
  Widget build(BuildContext context) {
    setState(() {
      obtenerPreferencias();
    });

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: _imagen.elementAt(widget.posicion),
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image.network(
                        _imagen.elementAt(widget.posicion),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nombre,
                          style: _style.titulo,
                        ),
                        Text('\$${_costo.elementAt(widget.posicion)}'),
                        Text(
                          _horario.elementAt(widget.posicion),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 350,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _nombre.values.elementAt(widget.posicion),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            wordSpacing: 2,
                            letterSpacing: 1,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    width: 300,
                    child: FlutterMap(
                      options: MapOptions(
                        center: latLng.LatLng(19.34, -99.19
                            //_location.keys.elementAt(widget.posicion),
                            //_location.values.elementAt(widget.posicion),
                            ),
                        zoom: 20,
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
                              point: latLng.LatLng(
                                _location.keys.elementAt(widget.posicion),
                                _location.values.elementAt(widget.posicion),
                              ),
                              builder: (BuildContext context) => const Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 5,
              child: TextButton.icon(
                label: const Text(
                  'Volver',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              right: 5,
              top: 10,
              child: IconButton(
                onPressed: () {
                  guardarPreferencias();
                  setState(
                    () {
                      if (_isSelected == true) {
                        _isSelected = false;
                      } else if (_isSelected == false) {
                        _isSelected = true;
                      }
                    },
                  );
                },
                icon: Icon(
                  Icons.favorite,
                  color: (_isSelected == true) ? Colors.red : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void obtenerPreferencias() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      valorGuardado = preferences.getBool("$_isSelected") ?? "";
    });
  }

  guardarPreferencias() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool("$_isSelected", _isSelected);
  }
}
