import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';

class AccountManagerMainScreen extends StatefulWidget {
  final name;
  final surname;
  final username;
  final emaiil;
  final password;
  final serialcode;
  const AccountManagerMainScreen(
      {super.key,
      this.name,
      this.surname,
      this.username,
      this.emaiil,
      this.password,
      this.serialcode});

  @override
  State<AccountManagerMainScreen> createState() =>
      _AccountManagerMainScreenState();
}

class _AccountManagerMainScreenState extends State<AccountManagerMainScreen> {
  bool _obscureSurname = true;
  bool _obscureUsernmae = true;
  final _nomeText = TextEditingController();
  final _surnameText = TextEditingController();
  final _usernameText = TextEditingController();

  void _toggleSurnaneVisibility() {
    setState(() {
      _obscureSurname = !_obscureSurname;
    });
  }

  void _toggleUsernameVisibility() {
    setState(() {
      _obscureUsernmae = !_obscureUsernmae;
    });
  }

  @override
  Widget build(BuildContext context) {
    const sizeImage = 24.0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: neutral,
        ),
        backgroundColor: primary,
        title: Text(
          'ACCOUNT MANAGER',
          style: TextStyle(color: neutral),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Account',
                  style: TextStyle(
                      fontSize: 22,
                      color: primary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(_nomeText, 'Name', widget.name,
                    obscureText: false),
                buildTextField(
                  _surnameText,
                  'Surname',
                  widget.surname,
                  obscureText: _obscureSurname,
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      _obscureSurname
                          ? 'assets/images/eye_off_icon.png'
                          : 'assets/images/eye_on_icon.png',
                      width: sizeImage,
                      height: sizeImage,
                    ),
                    onPressed: _toggleSurnaneVisibility,
                  ),
                ),
                buildTextField(
                  _usernameText,
                  'Username',
                  widget.username,
                  obscureText: _obscureUsernmae,
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      _obscureUsernmae
                          ? 'assets/images/eye_off_icon.png'
                          : 'assets/images/eye_on_icon.png',
                      width: sizeImage,
                      height: sizeImage,
                    ),
                    onPressed: _toggleUsernameVisibility,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: TextButton(
                onPressed: () {
                  buildDialogDeletions(context, "Account deletion",
                      "Do you really want to delete your account?");
                },
                child: const Text(
                  'Delete Account',
                  style: TextStyle(color: error, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String labelText, String text,
      {bool obscureText = false, Widget? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: primary, fontSize: 23),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: text,
          hintStyle: const TextStyle(color: primary),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

Future buildDialogDeletions(context, String titolo, String testo) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titolo),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(testo),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Chiudi il popup
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Chiudi il popup
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
