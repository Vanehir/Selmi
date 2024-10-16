import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({super.key});

  @override
  _SearchMainScreen createState() => _SearchMainScreen();
}

class _SearchMainScreen extends State<SearchMainScreen> {
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: primario),
                      borderRadius: BorderRadius.circular(40))),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...", // Placeholder del campo di ricerca
                  border: InputBorder.none, // Nessun bordo predefinito
                  contentPadding: const EdgeInsets.symmetric(vertical: 15)
                      .copyWith(left: 20), // Padding verticale
                  suffixIcon: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Minimizza la larghezza della Row
                    children: <Widget>[
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: primario)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.qr_code_scanner,
                              color: primario)),
                    ],
                  ),
                ),
              ),
            ),
          ), // Search bar // search bar
          Container(), // lista
        ],
      ),
    );
  }
}
