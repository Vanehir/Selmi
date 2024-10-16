import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  _SettingsMainScreen createState() => _SettingsMainScreen();
}

class _SettingsMainScreen extends State<SettingsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: primario,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 25, top: 20, right: 0, bottom: 5),
                child: Text(
                  "Acount",
                  style: TextStyle(
                    color: secondario,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 5, right: 25, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/user_icon_settings.png"), // immagine
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "Account Management",
                                  style:
                                      TextStyle(fontSize: 25, color: primario),
                                ),
                                const Spacer(),
                                Image.asset('assets/images/right_icon.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ), // Account management
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/notification_icon.png"), // immagine
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "Notifications",
                                  style:
                                      TextStyle(fontSize: 25, color: primario),
                                ),
                                const Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ), // Notifications
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/log_out_icon.png"), // immagine
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "Sing Out",
                                  style:
                                      TextStyle(fontSize: 25, color: primario),
                                ),
                                const Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
                            ),
                          ),
                        ),
                      ), // Sing Out
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ), // Account
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 25, top: 20, right: 0, bottom: 5),
                child: Text(
                  "General",
                  style: TextStyle(
                    color: secondario,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 5, right: 25, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        child: InkWell(
                          // mi permette di eseguire diverse azioni su un widget con un animazione visibile all'utente
                          onTap: () {
                            print("Cliccato");
                          },
                          child: Container(
                            child: Row(
                              children: [
                                const Icon(Icons.display_settings), // immagine
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "Display",
                                  style:
                                      TextStyle(fontSize: 25, color: primario),
                                ),
                                const Spacer(),
                                Image.asset('assets/images/right_icon.png'),
                              ],
                            ),
                          ),
                        ),
                      ), // Display
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/language_icon.png"), // immagine
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "App Language",
                                  style:
                                      TextStyle(fontSize: 25, color: primario),
                                ),
                                const Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
                            ),
                          ),
                        ),
                      ), // App Language
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              print("Cliccato");
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/lock_icon.png"), // immagine
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "Security",
                                  style:
                                      TextStyle(fontSize: 25, color: primario),
                                ),
                                const Spacer(),
                                Image.asset("assets/images/right_icon.png"),
                              ],
                            ),
                          ),
                        ),
                      ), // Security
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(), // General
      ],
    );
  }
}
