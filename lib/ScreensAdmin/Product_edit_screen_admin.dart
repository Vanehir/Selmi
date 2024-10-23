import 'package:flutter/material.dart';
import 'package:prove/ScreensAdmin/Product_main_screen_admin.dart';
import 'package:google_fonts/google_fonts.dart';
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

  void _selezione() {
    setState(() {
      _isCheck = !_isCheck;
    });
  }

  void _selezioneManual() {
    setState(() {
      _isCheckManual = !_isCheckManual;
    });
  }

  void _selezioneOther() {
    setState(() {
      _isCheckOther = !_isCheckOther;
    });
  }

  void _back() {
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ProductMainScreenAdmin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: background,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Product",
              style: GoogleFonts.bebasNeue(
                fontSize: 30,
                color: background,
              ),
            ),
            InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.edit),
                ))
          ],
        ),
        backgroundColor: primario,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  const Center(
                      child: SizedBox(
                          height: 300,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 100,
                          ))),
                  const Positioned(top: 20, right: 20, child: Icon(Icons.star)),
                  const Positioned(
                      bottom: 20, left: 20, child: Icon(Icons.qr_code_scanner)),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Image.asset("assets/images/language_icon.png")),
                ],
              ),
            ), // immagine
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 8, right: 20, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Specs",
                              style: TextStyle(fontSize: 25, color: primario)),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  child: InkWell(
                                      onTap: () {
                                        _selezione();
                                      },
                                      child: _isCheck
                                          ? Image.asset(
                                              "assets/images/check-box_si.png")
                                          : Image.asset(
                                              "assets/images/ceck_no.png")),
                                ),
                                Image.asset("assets/images/pdf_icon.png"),
                                Container(
                                  child: const Column(
                                    children: [
                                      Text("Nome Doumento",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: secondario)),
                                      Row(
                                        children: [
                                          SizedBox(width: 50),
                                          Text("Data Upload",
                                              style:
                                                  TextStyle(color: secondario)),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text("Type",
                                              style:
                                                  TextStyle(color: secondario)),
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
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 8, right: 20, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Manual",
                              style: TextStyle(fontSize: 25, color: primario)),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  child: InkWell(
                                      onTap: () {
                                        _selezioneManual();
                                      },
                                      child: _isCheckManual
                                          ? Image.asset(
                                              "assets/images/check-box_si.png")
                                          : Image.asset(
                                              "assets/images/ceck_no.png")),
                                ),
                                Image.asset("assets/images/pdf_icon.png"),
                                Container(
                                  child: const Column(
                                    children: [
                                      Text("Nome Doumento",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: secondario)),
                                      Row(
                                        children: [
                                          SizedBox(width: 50),
                                          Text("Data Upload",
                                              style:
                                                  TextStyle(color: secondario)),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text("Type",
                                              style:
                                                  TextStyle(color: secondario)),
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
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 8, right: 20, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Other",
                              style: TextStyle(fontSize: 25, color: primario)),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  child: InkWell(
                                      onTap: () {
                                        _selezioneOther();
                                      },
                                      child: _isCheckOther
                                          ? Image.asset(
                                              "assets/images/check-box_si.png")
                                          : Image.asset(
                                              "assets/images/ceck_no.png")),
                                ),
                                Image.asset("assets/images/pdf_icon.png"),
                                Container(
                                  child: const Column(
                                    children: [
                                      Text("Nome Doumento",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              color: secondario)),
                                      Row(
                                        children: [
                                          SizedBox(width: 50),
                                          Text("Data Upload",
                                              style:
                                                  TextStyle(color: secondario)),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text("Type",
                                              style:
                                                  TextStyle(color: secondario)),
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
                      padding: const EdgeInsets.only(left: 120, right: 120),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 2, color: primario))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  _back();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.chevron_left),
                                )),
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.restore_from_trash),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) // other
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
