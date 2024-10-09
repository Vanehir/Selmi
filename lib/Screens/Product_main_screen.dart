import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

class ProductMainScreen extends StatefulWidget {
  final String nome;
  final String immagine;
  const ProductMainScreen({required this.nome,required this.immagine, super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
/*
  late String appBarTitle;
  late String bodyImage;

  @override
  void initState() {
    super.initState();
    // Dividi la stringa e assegna i valori a variabili di stato
    List<String> parti = widget.nome.split(',');
    appBarTitle = parti.length > 0 ? parti[0] : '';
    bodyImage = parti.length > 1 ? parti[1] : '';
  }
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: neutral,
        ),
        title: Text(widget.nome, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: error),),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Center(child: Image.network(widget.immagine, height: 300,)),
                Positioned( //absolute position
                  top: 20, right: 20,
                    child: InkWell(
                      onTap: (){},
                        child: Icon(Icons.star))),
                Positioned(
                  bottom: 20, left: 20,
                    child: InkWell(
                      onTap: (){},
                        child: Icon(Icons.qr_code_scanner))),
                Positioned(
                  bottom: 20, right: 20,
                    child: InkWell(
                      onTap: (){},
                        child: Image.asset("assets/images/language_icon.png"))),
              ],
            ),
          ), // immagine e icone
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Specs", style: TextStyle(fontSize: 25, color: primary),),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: secondary),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 50,),
                                        Text("Data Upload", style: TextStyle( color: secondary),),
                                        SizedBox(width: 100,),
                                        Text("Type",style: TextStyle( color: secondary),),
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
                ),// specs
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Manual", style: TextStyle(fontSize: 25, color: primary),),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: secondary),),
                                    Row(
                                      children: [
                                        SizedBox(width: 50,),
                                        Text("Data Upload", style: TextStyle( color: secondary),),
                                        SizedBox(width: 100,),
                                        Text("Type",style: TextStyle( color: secondary),),
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
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Other", style: TextStyle(fontSize: 25, color: primary),),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: secondary),),
                                    Row(
                                      children: [
                                        SizedBox(width: 50,),
                                        Text("Data Upload", style: TextStyle( color: secondary),),
                                        SizedBox(width: 100,),
                                        Text("Type",style: TextStyle( color: secondary),),
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
