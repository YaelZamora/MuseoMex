import 'package:flutter/material.dart';

class Style {
  final titulo = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final descripcion = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );
  final precio = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final appBarText = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
