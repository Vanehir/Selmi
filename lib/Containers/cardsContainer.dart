import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomContainer extends StatelessWidget {
  final String title;

  const MyCustomContainer({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[200], // Sfondo del container principale
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Spazio blu con il titolo
            Container(
              padding: const EdgeInsets.all(10),
              color: primario, // Sfondo blu
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 24,
                  color: background, // Colore del testo
                ),
              ),
            ),

            // Spazio vuoto con la card sotto
            const SizedBox(height: 10), // Spaziatura tra il titolo e la card

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 4, // Ombreggiatura della card
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Bordo arrotondato
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 50, color: secondario),
                        const SizedBox(height: 10),
                        Text(
                          'Card Content',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
