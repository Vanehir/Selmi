import 'package:flutter/material.dart';

class SavedMainScreen extends StatefulWidget {
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
        SizedBox(height: 50),
        Padding(padding: const EdgeInsets.all(20),
        child: Container(
          decoration: ShapeDecoration(shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Color(0xFF25344D)),
            borderRadius: BorderRadius.circular(40)
          )),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...", // Placeholder del campo di ricerca
              border: InputBorder.none, // Nessun bordo predefinito
              contentPadding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 20),  // Padding verticale
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,// Minimizza la larghezza della Row
                children: <Widget>[
                  SizedBox(width: 5,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Color(0xFF25344D))),
                  IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,color: Color(0xFF25344D))),
                ],
              ),
              ),
            ),
          ),
        ), // Search bar
        SizedBox(height: 40),
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
                  color: selectedIndex == 0 ? Color(0xFF25344D) : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5), // Arrotonda solo l'angolo in alto a destra
                  ),
                  border: Border.all(
                    color: Color(0xFF25344D),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Owned",
                      style: TextStyle(
                        color: selectedIndex == 0 ? Color(0xFFF8F9FA) : Color(0xFF25344D),
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
                  color: selectedIndex == 1 ? Color(0xFF25344D) : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), // Arrotonda solo l'angolo in alto a sinistra
                  ),
                  border: Border.all(
                    color: Color(0xFF25344D),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Favourites",
                      style: TextStyle(
                        color: selectedIndex == 1 ? Color(0xFFF8F9FA) : Color(0xFF25344D),
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
              color: Color(0xFF25344D),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: selectedIndex == 0
                  ? Text(
                "Owned content",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
                  : Text(
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
