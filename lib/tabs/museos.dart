import 'package:day21/lists/costos.dart';
import 'package:day21/lists/imagen.dart';
import 'package:day21/lists/nombre_museos.dart';
import 'package:day21/pages/info_page.dart';
import 'package:day21/widgets/item.dart';
import 'package:day21/widgets/textbox.dart';
import 'package:flutter/material.dart';

class MuseosTab extends StatefulWidget {
  MuseosTab({Key? key}) : super(key: key);

  @override
  State<MuseosTab> createState() => _MuseosTabState();
}

class _MuseosTabState extends State<MuseosTab> {
  final List<String> _imagen = imagen;

  final Map<String, String> _nombre = museos;

  final List<double> _costo = costos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          const TextBox(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: _imagen.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 30);
              },
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return InfoPage(
                            nombre: _nombre.keys.elementAt(index),
                            posicion: index,
                          );
                        },
                      ),
                    );
                  },
                  child: Item(
                    hero: _imagen.elementAt(index),
                    costo: (_costo.elementAt(index) == 0)
                        ? 'Gratis'
                        : _costo.elementAt(index).toString(),
                    descripcion: _nombre.values.elementAt(index),
                    nombre: _nombre.keys.elementAt(index),
                    url: _imagen.elementAt(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
