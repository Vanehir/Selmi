import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

class SavedMainScreen extends StatefulWidget {
  const SavedMainScreen({super.key});

  @override
  _SavedMainScreen createState() => _SavedMainScreen();
}

class _SavedMainScreen extends State<SavedMainScreen> {
  // Variabile per tracciare il tab selezionato
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
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
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 20), // Padding verticale
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
                        icon:
                            const Icon(Icons.qr_code_scanner, color: primario)),
                  ],
                ),
              ),
            ),
          ),
        ), // Search bar
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Tab "Owned"
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0; // Imposta "Owned" come selezionato
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? primario : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(
                        5), // Arrotonda solo l'angolo in alto a destra
                  ),
                  border: Border.all(
                    color: primario,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Owned",
                      style: TextStyle(
                        color: selectedIndex == 0 ? background : primario,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Tab "Favourites"
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1; // Imposta "Favourites" come selezionato
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? primario : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                        5), // Arrotonda solo l'angolo in alto a sinistra
                  ),
                  border: Border.all(
                    color: primario,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Favourites",
                      style: TextStyle(
                        color: selectedIndex == 1 ? background : primario,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ), // fa la stessa cosa di InkWell
          ],
        ),
        // Contenuto dinamico basato sul tab selezionato
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: primario,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: selectedIndex == 0
                  ? const Text(
                      "Owned content",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  : const Text(
                      "Favourites content",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
