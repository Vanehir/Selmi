import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Language_settings_screen.dart';
import 'package:prove/Screens/Login_screen.dart';
import 'package:prove/main.dart';
import 'Notification_settings_screen.dart';

class SettingsMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: variant,
      appBar: AppBar(
        title: Text("SETTINGS", style: TextStyle(color: neutral, fontSize: 30)),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          _buildSectionTitle(context, "ACCOUNT"),
          _buildSettingItem(
            context,
            "Account Management",
            "assets/images/user_icon_settings.png",
                () => print("Cliccato"),
          ),
          _buildSettingItem(
            context,
            "Notifications",
            "assets/images/notification_icon.png",
                () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
            ),
          ),
          _buildSettingItem(
            context,
            "Sign Out",
            "assets/images/log_out_icon.png",
                () => _showSignOutDialog(context),
          ),
          SizedBox(height: 20),
          _buildSectionTitle(context, "GENERAL"),
          _buildSettingItem(
            context,
            "Display",
            "assets/images/display_icon.png",
                () => print("Cliccato"),
          ),
          _buildSettingItem(
            context,
            "App Language",
            "assets/images/language_icon.png",
                () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LanguageSettingsScreen()),
            ),
          ),
          _buildSettingItem(
            context,
            "Security",
            "assets/images/lock_icon.png",
                () => print("Cliccato"),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sign Out", style: TextStyle(color: primary),),
          content: Text("Sei sicuro di voler uscire? Dovrai accedere nuovamente.", style: TextStyle(color: primary),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Chiudi il popup
              },
              child: Text("Annulla", style: TextStyle(color: primary),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Chiudi il popup
                // Qui puoi aggiungere il codice per effettuare il sign out e reindirizzare l'utente
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false, // Rimuovi tutte le schermate precedenti
                );
                print("Uscito");
              },
              child: Text("Esci", style: TextStyle(color: error),),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, bottom: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: neutral, width: 2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Image.asset(iconPath),
                SizedBox(width: 15),
                Text(title, style: Theme.of(context).textTheme.bodyLarge),
                Spacer(),
                Image.asset('assets/images/right_icon.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
