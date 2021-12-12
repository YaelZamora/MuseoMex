import 'dart:ui';

import 'package:day21/pages/favoritos_page.dart';
import 'package:day21/src/styles/textstyle.dart';
import 'package:day21/tabs/museos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _style = Style();
  bool _isSelected = false;
  int id = 0;
  final List<Widget> index = [
    MuseosTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Museos',
          style: _style.appBarText,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff71F3FC),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                content: const Text('Estamos trabajando en esto.'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(
              Icons.favorite,
              color: (_isSelected == true) ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          index[id],
        ],
      ),
    );
  }
}
