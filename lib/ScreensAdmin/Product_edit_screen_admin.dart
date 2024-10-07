import 'package:flutter/material.dart';
import 'package:prove/ScreensAdmin/Product_main_screen_admin.dart';

import '../Colors/color_palette.dart';

class ProductEditScreenAdmin extends StatefulWidget {
  const ProductEditScreenAdmin({super.key});

  @override
  State<ProductEditScreenAdmin> createState() => _ProductEditScreenAdminState();
}

class _ProductEditScreenAdminState extends State<ProductEditScreenAdmin> {

  bool _isCheck = false;
  bool _isCheckManual = false;
  bool _isCheckOther = false; // Controlla se il ceck_box è ceccato o meno

  void _selezione(){
    setState(() {
      _isCheck = !_isCheck;
    });
  }
  void _selezioneManual(){
    setState(() {
      _isCheckManual = !_isCheckManual;
    });
  }
  void _selezioneOther(){
    setState(() {
      _isCheckOther = !_isCheckOther;
    });
  }

  void _back(){
    setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProductMainScreenAdmin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: light,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Prodotto", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: rederror),),
            InkWell(
              onTap: (){

              },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.edit),
                ))
          ],
        ),
        backgroundColor: darklue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Center(
                      child: Container(
                        height: 300,
                          child: Icon(Icons.add_a_photo_outlined,size: 100,))),
                  Positioned(
                      top: 20, right: 20,
                      child: Icon(Icons.star)),
                  Positioned(
                      bottom: 20, left: 20,
                      child: Icon(Icons.qr_code_scanner)),
                  Positioned(
                      bottom: 20, right: 20,
                      child: Image.asset("assets/images/language_icon.png")),
                ],
              ),
            ), // immagine
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Specs", style: TextStyle(fontSize: 25, color: darklue)),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  child: InkWell(
                                      onTap: (){
                                        _selezione();
                                      },
                                      child: _isCheck ? Image.asset("assets/images/check-box_si.png") : Image.asset("assets/images/ceck_no.png")),
                                ),
                                Image.asset("assets/images/pdf_icon.png"),
                                Container(
                                  child: Column(
                                    children: [
                                      Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: lightblue)),
                                      Row(
                                        children: [
                                          SizedBox(width: 50),
                                          Text("Data Upload", style: TextStyle( color: lightblue)),
                                          SizedBox(width: 100,),
                                          Text("Type",style: TextStyle( color: lightblue)),
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
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Manual", style: TextStyle(fontSize: 25, color: darklue)),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  child: InkWell(
                                      onTap: (){
                                        _selezioneManual();
                                      },
                                      child: _isCheckManual ? Image.asset("assets/images/check-box_si.png") : Image.asset("assets/images/ceck_no.png")),
                                ),
                                Image.asset("assets/images/pdf_icon.png"),
                                Container(
                                  child: Column(
                                    children: [
                                      Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: lightblue)),
                                      Row(
                                        children: [
                                          SizedBox(width: 50),
                                          Text("Data Upload", style: TextStyle( color: lightblue)),
                                          SizedBox(width: 100,),
                                          Text("Type",style: TextStyle( color: lightblue)),
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
                  ), // manual
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Other", style: TextStyle(fontSize: 25, color: darklue)),
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  child: InkWell(
                                      onTap: (){
                                        _selezioneOther();
                                      },
                                      child: _isCheckOther ? Image.asset("assets/images/check-box_si.png") : Image.asset("assets/images/ceck_no.png")),
                                ),
                                Image.asset("assets/images/pdf_icon.png"),
                                Container(
                                  child: Column(
                                    children: [
                                      Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: lightblue)),
                                      Row(
                                        children: [
                                          SizedBox(width: 50),
                                          Text("Data Upload", style: TextStyle( color: lightblue)),
                                          SizedBox(width: 100,),
                                          Text("Type",style: TextStyle( color: lightblue)),
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
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 120,right: 120),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 2, color: darklue))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                _back();
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.chevron_left),
                                )),
                            InkWell(
                              onTap: (){

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.restore_from_trash),
                              ),
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )// other
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}