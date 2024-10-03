import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

class ProductMainScreen extends StatefulWidget {
  const ProductMainScreen({super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: light,
        ),
        title: Text("Prodotto", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: rederror),),
        backgroundColor: darklue,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Center(child: Image.network('https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png', height: 300,)),
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
                        Text("Specs", style: TextStyle(fontSize: 25, color: darklue),),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: lightblue),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 50,),
                                        Text("Data Upload", style: TextStyle( color: lightblue),),
                                        SizedBox(width: 100,),
                                        Text("Type",style: TextStyle( color: lightblue),),
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
                        Text("Manual", style: TextStyle(fontSize: 25, color: darklue),),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: lightblue),),
                                    Row(
                                      children: [
                                        SizedBox(width: 50,),
                                        Text("Data Upload", style: TextStyle( color: lightblue),),
                                        SizedBox(width: 100,),
                                        Text("Type",style: TextStyle( color: lightblue),),
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
                        Text("Other", style: TextStyle(fontSize: 25, color: darklue),),
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Image.asset("assets/images/pdf_icon.png"),
                              Container(
                                child: Column(
                                  children: [
                                    Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: lightblue),),
                                    Row(
                                      children: [
                                        SizedBox(width: 50,),
                                        Text("Data Upload", style: TextStyle( color: lightblue),),
                                        SizedBox(width: 100,),
                                        Text("Type",style: TextStyle( color: lightblue),),
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
