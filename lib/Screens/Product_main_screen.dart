import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

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
