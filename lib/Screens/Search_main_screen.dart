import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prove/Colors/color_palette.dart';


class SearchMainScreen extends StatefulWidget {
  @override
  _SearchMainScreen createState() => _SearchMainScreen();
}

class _SearchMainScreen extends State<SearchMainScreen> {

  final TextEditingController _search = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50,),
            Padding(padding: const EdgeInsets.all(20),
              child: Container(
                decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: darklue),
                    borderRadius: BorderRadius.circular(40)
                )),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...", // Placeholder del campo di ricerca
                    border: InputBorder.none, // Nessun bordo predefinito
                    contentPadding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 20),  // Padding verticale
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min, // Minimizza la larghezza della Row
                      children: <Widget>[
                        SizedBox(width: 5,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: darklue)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,color: darklue)),
                      ],
                    ),
                  ),
                ),
              ),
            ), // Search bar // search bar
            Container(), // lista
          ],
        ),
    );
  }
}
