import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/model/Richiesta_Model.dart';
import 'package:prove/widgets/customer_scaffold.dart';

import 'Document_main_screen.dart';
import 'Product_main_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(
        pages: [
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/selmi_logo.png', // replace with actual image URL
                height: 200,
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2)
                    )
                ),
                child: Text("Last scanned machine", style: TextStyle(color: darklue, fontSize: 25),),
              ), // last scan
              SizedBox(height: 0),
              // Fetch and display the list from JSON
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchTemperaggioData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: rederror),));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data found',style: TextStyle(color: rederror)));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return Container(
                            width: double.infinity,
                            child: ListTile(
                              title: Container(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ProductMainScreen(nome: 'Prodotto', immagine: "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png")));
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(item['Image'], height: 80, width: 50, fit: BoxFit.cover,),
                                      ),
                                      Column(
                                        children: [
                                          Text(item['nome'], style: TextStyle(fontSize: 18, color: lightblue),),
                                          Row(
                                            children: [
                                              Text(item['category'], style: TextStyle(color: lightblue),maxLines: 1, overflow: TextOverflow.ellipsis),
                                              SizedBox(width: 20,),
                                              Text(item['year'], style: TextStyle(color: lightblue),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 80,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2)
                    )
                ),
                child: Text("Last documents opened", style: TextStyle(color: darklue, fontSize: 25),),
              ), // last opened
              SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchDocumentiData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: rederror),));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data found',style: TextStyle(color: rederror)));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return Container(
                            /* decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 2)
                          )
                      ),

                      */ // border bottom
                            width: double.infinity,
                            child: ListTile(
                              title: Container(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => DocumentMainScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('assets/images/pdf_icon.png'),
                                      ),
                                      Column(
                                        children: [
                                          Text(item['name'], style: TextStyle(fontSize: 18, color: lightblue),),
                                          Row(
                                            children: [
                                              Text(item['data'], style: TextStyle(color: lightblue),maxLines: 1, overflow: TextOverflow.ellipsis),
                                              SizedBox(width: 20,),
                                              Text(item['tipo'], style: TextStyle(color: lightblue),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 80,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),// home page
          Center(child: Text('Search Page')),
          Center(child: Text('Qr Page')),
          Center(child: Text('Saved Page')),
          Center(child: Text('Settings Page')),
        ],
      ),
    );
  }
}
