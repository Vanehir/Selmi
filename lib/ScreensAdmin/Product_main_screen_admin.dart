import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/ScreensAdmin/Product_edit_screen_admin.dart';
import '../Screens/Document_main_screen.dart';

class ProductMainScreenAdmin extends StatefulWidget {
  final String nome;
  final String immagine;

  const ProductMainScreenAdmin({
    super.key,
    required this.nome,
    required this.immagine,
  });

  @override
  State<ProductMainScreenAdmin> createState() => _ProductMainScreenAdminState();
}

class _ProductMainScreenAdminState extends State<ProductMainScreenAdmin> {
  void navigateToDocumentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DocumentMainScreen()),
    );
  }

  void _edit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductEditScreenAdmin(
          nome: widget.nome,
          immagine: widget.immagine,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: neutral),
        title: Text(
          widget.nome,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: neutral),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(accesso: 'admin')),
                    (Route<dynamic> route) => false, // Rimuove tutte le rotte precedenti
              );
            }, 
            icon: Icon(Icons.arrow_back)),
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSection(),
            SizedBox(height: 50),
            _buildDocumentSection("Specs", "Specifiche", "16/10/2024", "pdf"),
            SizedBox(height: 50),
            _buildDocumentSection("Manual", "Manuale", "16/10/2024", "pdf"),
            SizedBox(height: 50),
            _buildDocumentSection("Other", "Documento", "16/10/2024", "pdf"),
            SizedBox(height: 30),
            _buildEditButton(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Center(child: Image.network(widget.immagine, height: 300)),
          Positioned(top: 20, right: 20, child: Icon(Icons.star)),
          Positioned(bottom: 20, left: 20, child: Icon(Icons.qr_code_scanner)),
          Positioned(bottom: 20, right: 20, child: Image.asset("assets/images/language_icon.png")),
        ],
      ),
    );
  }

  Widget _buildDocumentSection(String title, String documentName, String uploadDate, String fileType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Image.asset("assets/images/pdf_icon.png"),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: navigateToDocumentScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 25, color: primary)),
                  Row(
                    children: [
                      Text(documentName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: secondary)),
                      Spacer(),
                      Text(uploadDate, style: TextStyle(color: secondary)),
                      Spacer(),
                      Text(fileType, style: TextStyle(color: secondary)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 140),
      child: InkWell(
        onTap: _edit,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 2, color: primary),
            ),
          ),
          child: Icon(Icons.mode_edit),
        ),
      ),
    );
  }
}
