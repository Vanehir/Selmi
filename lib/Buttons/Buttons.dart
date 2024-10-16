import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DownloadButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primario,
        padding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 95), // Padding del bottone
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Angoli arrotondati
        ),
      ),
      child: Text(
        this.text,
        style: GoogleFonts.dosis(
          color: background, // Colore del testo
          fontSize: 20, // Dimensione del testo
        ),
      ),
    );
  }
}
