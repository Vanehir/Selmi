import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Register_main_screen.dart';
import 'package:prove/ScreensAdmin/Product_main_screen_admin.dart';
import 'package:prove/ScreensGuest/Qr_scan_main_screen_guest.dart';
import 'package:prove/Colors/color_palette.dart';

class LoginScreen extends StatefulWidget {
  final String name;
  final String surname;
  final String username;
  final String emaiil;
  final String password;
  final String serialcode;
  const LoginScreen({super.key, required this.name, required this.surname, required this.username, required this.emaiil, required this.password, required this.serialcode});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String _data = "Nessun dato ancora"; // Inizializzo il testo di default

  @override
  void initState() {
    super.initState();
    _readData();
  }

  // Funzione per scrivere dati nel database
  Future<void> _writeData() async {
    await _database.child('users').child('user1').set({
      'username': 'PORCO',
      'email': 'DIO',
    });
    print('Dati scritti nel database!');
  }

  // Funzione per leggere dati dal database
  void _readData() {
    _database.child('users').child('user1').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          _data = 'Username: ${data['username']}, Email: ${data['email']}';
        });
      } else {
        setState(() {
          _data = 'Nessun dato trovato nel database!';
        });
      }
    });
  }

  final _passwordInput = TextEditingController();
  final _usernameInput = TextEditingController();
  final String user = 'icts';
  final String admin = 'admin';
  bool _obscureText = true;

  void _checkInput() {
    final username = _usernameInput.text;
    final password = _passwordInput.text;

    if (username == user && password == user) {
      _navigateTo(HomeScreen(accesso: 'user', name: widget.name, surname: widget.surname, username: widget.username, emaiil: widget.emaiil, password: widget.password, serialcode: widget.serialcode,));
    } else if (username == admin && password == admin) {
      _navigateTo(HomeScreen(accesso: 'admin', name: widget.name, surname: widget.surname, username: widget.username, emaiil: widget.emaiil, password: widget.password, serialcode: widget.serialcode,));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Username o Password non validi',
            style: TextStyle(fontSize: 15),
          ),
        ),
      );
    }
  }

  void _navigateTo(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.05),
              const Text(
                'Selmi',
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(height: screenHeight * 0.2),
              _buildTextField(_usernameInput, 'Username', false),
              SizedBox(height: screenHeight * 0.05),
              _buildTextField(
                _passwordInput,
                'Password',
                _obscureText,
                suffixIcon: IconButton(
                  icon: Image.asset(
                    _obscureText
                        ? 'assets/images/eye_off_icon.png'
                        : 'assets/images/eye_on_icon.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              _buildButton(
                onPressed: _checkInput,
                text: 'Login',
                color: primary,
                textColor: neutral,
              ),
              _buildTextButton("Forgot Password?", (){}),
              _buildTextButton("Register", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterMainScreen()),
                );
              }),
              SizedBox(height: screenHeight * 0.02),
              _buildTextButton("Skip", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QrScanMainScreenGuest()),
                );
              }, fontSize: 30, isBold: true),
              // Mostra i dati letti dal database
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
      backgroundColor: neutral,
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      bool obscureText,
      {Widget? suffixIcon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: primary),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: primary, fontSize: 23),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: primary),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required String text,
    required Color color,
    required Color textColor,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 2, color: color),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200, color: textColor),
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed,
      {double fontSize = 17, bool isBold = false}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: secondary,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
