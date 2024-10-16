import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/model/Richiesta_Model.dart';
import 'package:prove/widgets/customer_scaffold.dart';

import 'Document_main_screen.dart';
import 'Product_main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2))),
                child: const Text(
                  "Last scanned machine",
                  style: TextStyle(color: primario, fontSize: 25),
                ),
              ), // last scan
              const SizedBox(height: 0),
              // Fetch and display the list from JSON
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchTemperaggioData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: accento),
                      ));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No data found',
                              style: TextStyle(color: accento)));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return SizedBox(
                            width: double.infinity,
                            child: ListTile(
                              title: Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProductMainScreen(
                                                    nome: 'Prodotto',
                                                    immagine:
                                                        "https://www.selmi-group.it/img/macchine-temperaggio-cioccolato/selmi-one-temperatrice-cioccolato/selmi-one-temperatrice-cioccolato.png")));
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          item['Image'],
                                          height: 80,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            item['nome'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: secondario),
                                          ),
                                          Row(
                                            children: [
                                              Text(item['category'],
                                                  style: const TextStyle(
                                                      color: secondario),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                item['year'],
                                                style: const TextStyle(
                                                    color: secondario),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 80,
                                      )
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
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2))),
                child: const Text(
                  "Last documents opened",
                  style: TextStyle(color: primario, fontSize: 25),
                ),
              ), // last opened
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchDocumentiData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: accento),
                      ));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No data found',
                              style: TextStyle(color: accento)));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data![index];
                          return SizedBox(
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DocumentMainScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/images/pdf_icon.png'),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            item['name'],
                                            style: const TextStyle(
                                                fontSize: 18, color: accento),
                                          ),
                                          Row(
                                            children: [
                                              Text(item['data'],
                                                  style: const TextStyle(
                                                      color: accento),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                item['tipo'],
                                                style: const TextStyle(
                                                    color: accento),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 80,
                                      )
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
          ), // home page
          const Center(child: Text('Search Page')),
          const Center(child: Text('Qr Page')),
          const Center(child: Text('Saved Page')),
          const Center(child: Text('Settings Page')),
        ],
      ),
    );
  }
}
