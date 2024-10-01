import 'package:flutter/material.dart';

class ProductMainScreenAdmin extends StatefulWidget {
  const ProductMainScreenAdmin({super.key});

  @override
  State<ProductMainScreenAdmin> createState() => _ProductMainScreenAdminState();
}
//sus

class _ProductMainScreenAdminState extends State<ProductMainScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFF8F9FA),
        ),
        title: Text("Prodotto", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFFC44536)),),
        backgroundColor: Color(0xFF25344D),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(child: Image.network('https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png', height: 300,)),
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
                              Text("Specs", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/pdf_icon.png"),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF59729D)),),
                                          Row(
                                            children: [
                                              SizedBox(width: 50,),
                                              Text("Data Upload", style: TextStyle( color: Color(0xFF59729D)),),
                                              SizedBox(width: 100,),
                                              Text("Type",style: TextStyle( color: Color(0xFF59729D)),),
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
                              Text("Manual", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/pdf_icon.png"),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF59729D)),),
                                          Row(
                                            children: [
                                              SizedBox(width: 50,),
                                              Text("Data Upload", style: TextStyle( color: Color(0xFF59729D)),),
                                              SizedBox(width: 100,),
                                              Text("Type",style: TextStyle( color: Color(0xFF59729D)),),
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
                              Text("Other", style: TextStyle(fontSize: 25, color: Color(0xFF25344D)),),
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/pdf_icon.png"),
                                    Container(
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Nome Doumento", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF59729D)),),
                                            Row(
                                              children: [
                                                SizedBox(width: 50,),
                                                Text("Data Upload", style: TextStyle( color: Color(0xFF59729D)),),
                                                SizedBox(width: 100,),
                                                Text("Type",style: TextStyle( color: Color(0xFF59729D)),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )// Other
                    ],
                  ),
                ), // Specs,Manual,Other
              ],
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(left: 150, right: 150),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 2, color: Color(0xFF25344D)))),
                    child: Icon(Icons.mode_edit),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
