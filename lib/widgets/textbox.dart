import 'package:day21/pages/search_page.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showSearch(
        context: context,
        delegate: SearchView(),
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(255, 255, 255, 0.2),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                enabled: false,
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hoverColor: Colors.transparent,
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () => showSearch(
                context: context,
                delegate: SearchView(),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
