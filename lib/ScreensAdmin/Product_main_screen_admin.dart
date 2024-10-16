import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/ScreensAdmin/Product_edit_screen_admin.dart';

class ProductMainScreenAdmin extends StatefulWidget {
  const ProductMainScreenAdmin({super.key});

  @override
  State<ProductMainScreenAdmin> createState() => _ProductMainScreenAdminState();
}
//sus

class _ProductMainScreenAdminState extends State<ProductMainScreenAdmin> {
  void _edit() {
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ProductEditScreenAdmin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: background,
        ),
        title: const Text(
          "Prodotto",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: accento),
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
                  Center(
                      child: Image.network(
                    'https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png',
                    height: 300,
                  )),
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
                      padding: const EdgeInsets.only(left: 140, right: 140),
                      child: InkWell(
                        onTap: _edit,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                      width: 2, color: primario))),
                          child: const Icon(Icons.mode_edit),
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
