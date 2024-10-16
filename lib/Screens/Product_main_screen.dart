import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductMainScreen extends StatefulWidget {
  final String nome;
  final String immagine;
  const ProductMainScreen(
      {required this.nome, required this.immagine, super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: background,
        ),
        title: Text(
          widget.nome,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: accento),
        ),
        backgroundColor: primario,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                    child: Image.network(
                  widget.immagine,
                  height: 300,
                )),
                Positioned(
                    //absolute position
                    top: 20,
                    right: 20,
                    child:
                        InkWell(onTap: () {}, child: const Icon(Icons.star))),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.qr_code_scanner))),
                Positioned(
                    bottom: 20,
                    right: 20,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/language_icon.png"))),
              ],
            ),
          ), // immagine e icone
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8, right: 20, bottom: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Specs",
                          style: TextStyle(fontSize: 25, color: primario),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: const Column(
                                  children: [
                                    Text(
                                      "Nome Doumento",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: secondario),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "Data Upload",
                                          style: TextStyle(color: secondario),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          "Type",
                                          style: TextStyle(color: secondario),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // specs
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8, right: 20, bottom: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Manual",
                          style: TextStyle(fontSize: 25, color: primario),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: const Column(
                                  children: [
                                    Text(
                                      "Nome Doumento",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: secondario),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "Data Upload",
                                          style: TextStyle(color: secondario),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          "Type",
                                          style: TextStyle(color: secondario),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //Manual
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8, right: 20, bottom: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Other",
                          style: TextStyle(fontSize: 25, color: primario),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: const Column(
                                  children: [
                                    Text(
                                      "Nome Doumento",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: secondario),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "Data Upload",
                                          style: TextStyle(color: secondario),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text(
                                          "Type",
                                          style: TextStyle(color: secondario),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), // Other
              ],
            ),
          ), // Specs,Manual,Other
        ],
      ),
    );
  }
}








/*
class _ProductMainScreenState extends State<ProductMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: background,
        ),
        title: Text(
          widget.nome,
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            color: background,
          ),
        ),
        backgroundColor: primario,
      ),
      body: Column(
        //body
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    widget.immagine,
                    height: 300,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.star),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  width: 25,
                  height: 25,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/eye_on_icon.png"),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/language_icon.png"),
                  ),
                ),
              ],
            ),
          ), // immagine e icone
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8, right: 20, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        //testo sopra il divider
                        "Description",
                        style: GoogleFonts.dosis(
                          fontSize: 25,
                          color: primario,
                        ),
                      ),
                      const Divider(
                        //la lineatra description e il resto del layout
                        color: textfaded,
                        height: 30,
                        thickness: 2,
                        indent: 0, //lunghezza da sinistra
                        endIndent: 0, //lunghezza da destra
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          //Testo sotto il divider
                          "to ad description",
                          style: GoogleFonts.dosis(
                            fontSize: 15,
                            color: primario,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), // specs

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 25, 0, 20),
                          child: Text(
                            "Data upload",
                            style: GoogleFonts.dosis(
                              fontSize: 13,
                              color: primario,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(280, 25, 0, 0),
                          child: Text(
                            "Type",
                            style: GoogleFonts.dosis(
                              fontSize: 13,
                              color: primario,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/