import 'package:day21/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({
    Key? key,
    required this.url,
    required this.nombre,
    required this.descripcion,
    required this.costo,
    required this.hero,
  }) : super(key: key);
  final _style = Style();
  final String url;
  final String nombre;
  final String descripcion;
  final String costo;
  final String hero;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Hero(
            tag: hero,
            child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(left: 10),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    nombre,
                    style: _style.titulo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    descripcion,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: _style.descripcion,
                  ),
                ),
                Text(
                  '\$$costo',
                  style: _style.precio,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 /*

 */