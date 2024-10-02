import 'package:flutter/material.dart';


class DocumentMainScreens extends StatelessWidget {
  final String nome;
   DocumentMainScreens({required this.nome, super.key});


  @override
  Widget build(BuildContext context) {
    return DocumentMainScreen();
  }
}


class DocumentMainScreen extends StatefulWidget {
  const DocumentMainScreen({super.key});

  @override
  State<DocumentMainScreen> createState() => _DocumentMainScreenState();
}

class _DocumentMainScreenState extends State<DocumentMainScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFF8F9FA)),
        backgroundColor: Color(0xFF25344D),
        title: Text("Documento", style: TextStyle(fontSize: 30, color: Color(0xFFC44536)),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                width: double.infinity,
                  child: Stack(
                    children: [
                      Center(child: Image.asset("assets/images/pdf_icon.png",scale: 0.2,)),
                      Positioned( top:20, right: 20, child: InkWell(onTap: (){}, child: Image.asset("assets/images/language_icon.png"))),
                      Positioned(bottom: 20, right: 20, child: InkWell(onTap: (){}, child: Icon(Icons.remove_red_eye_outlined))),
                    ],
                  ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text("La temperatrice modello CENTO si allinea alle versioni TOP EX e FUTURA EX conservandone le caratteristiche innovative delle stesse ma potenziando notevolmente la quantità produttiva grazie alla vasca da 100 kg che consentirà la ricopertura in tunnel di larghezza fino a 600 mm."), // description
                    SizedBox(height: 100,),
                    Row(
                      children: [
                        SizedBox(width: 40,),
                        Text("20/04/2010" , style: TextStyle(fontSize: 20),),
                        SizedBox(width: 150,),
                        Text("pdf", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(height: 100,),
                    TextButton(onPressed: (){}, child: Text("Download", style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 100,),
                    TextButton(onPressed: (){}, child: Text("Report Errors", style: TextStyle(fontSize: 25),)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
