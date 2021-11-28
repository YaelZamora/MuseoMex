import 'package:day21/lists/categoria_list.dart';
import 'package:day21/lists/imagen.dart';
import 'package:day21/lists/nombre_museos.dart';
import 'package:day21/pages/info_page.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final Map<String, String> _nombre = museos;
  final List<String> _imagen = imagen;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                children: const [
                  FilterButton(
                    name: 'Historia',
                    categoria: 'Historia',
                  ),
                  FilterButton(
                    name: 'Arte',
                    categoria: 'Arte',
                  ),
                  FilterButton(
                    name: 'Cultura',
                    categoria: 'Cultura',
                  ),
                  FilterButton(
                    name: 'Arte y Diseño',
                    categoria: 'Arte y diseño',
                  ),
                  FilterButton(
                    name: 'Interés especial',
                    categoria: 'Interés especial',
                  ),
                  FilterButton(
                    name: 'Digital',
                    categoria: 'Digital',
                  ),
                  FilterButton(
                    name: 'Ciencia y tecnología',
                    categoria: 'Ciencia y tecnología',
                  ),
                ],
              ),
            ),
            Carrusel(),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatefulWidget {
  const FilterButton({
    Key? key,
    required this.name,
    required this.categoria,
  }) : super(key: key);
  final String name;
  final String categoria;

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.name),
      selected: _isSelected,
      onSelected: (bool value) {
        setState(() {
          _isSelected = value;
        });
      },
      backgroundColor: Colors.white,
      side: const BorderSide(color: Color(0xff71F3FC)),
      selectedColor: const Color(0xff71F3FC),
    );
  }
}

class Carrusel extends StatelessWidget {
  Carrusel({
    Key? key,
  }) : super(key: key);

  final Map<String, String> _nombre = museos;
  final List<String> _imagen = imagen;
  final List<String> _categoria = categoriaList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
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
            child: Hero(
              tag: _imagen.elementAt(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  _imagen.elementAt(index),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
