import 'package:day21/lists/nombre_museos.dart';
import 'package:flutter/material.dart';

class SearchView extends SearchDelegate {
  final Map<String, String> sugerencias = museos;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text(
      'buildResults',
      style: TextStyle(color: Colors.black),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: const Center(
          child: Icon(
            Icons.museum_outlined,
            color: Colors.black38,
            size: 130,
          ),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (_, int index) => _SuggestionItem(
        nombre: sugerencias.keys.elementAt(index),
      ),
    );
  }
}

class _SuggestionItem extends StatelessWidget {
  final String nombre;

  const _SuggestionItem({
    Key? key,
    required this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nombre),
    );
  }
}
