import 'package:flutter/material.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Register_main_screen.dart';
import 'package:prove/ScreensAdmin/Product_main_screen_admin.dart';
import 'package:prove/ScreensGuest/Qr_scan_main_screen_guest.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:provider/provider.dart';
import 'package:prove/model/Object_class.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordInput = TextEditingController();
  final _usernameInput = TextEditingController();
  final String user = 'icts';
  final String admin = 'admin';
  bool _obscureText = true;

  void _checkInput() {
    final username = _usernameInput.text;
    final password = _passwordInput.text;

    if (username == user && password == user) {
      _navigateTo(HomeScreen(accesso: 'user',));
    } else if (username == admin && password == admin) {
      _navigateTo( HomeScreen(accesso: 'admin',));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username o Password non validi', style: TextStyle(fontSize: 15),)),
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
    final screenWidth = MediaQuery.of(context).size.width;

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
              _buildTextField(_passwordInput, 'Password', _obscureText,
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      _obscureText
                          ? 'assets/images/eye_off_icon.png'
                          : 'assets/images/eye_on_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: _togglePasswordVisibility,
                  )),
              SizedBox(height: screenHeight * 0.1),
              _buildButton(
                onPressed: _checkInput,
                text: 'Login',
                color: primary,
                textColor: neutral,
              ),
              _buildTextButton("Forgot Password?", () {}),
              _buildTextButton("Register", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterMainScreen()),
                );
              }),
              SizedBox(height: screenHeight * 0.02),
              _buildTextButton("Skip", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QrScanMainScreenGuest()),
                );
              }, fontSize: 30, isBold: true),
            ],
          ),
        ),
      ),
      backgroundColor: neutral,
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String hintText,
      bool obscureText, {
        Widget? suffixIcon,
      }) {
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15), // Aggiungi un padding verticale per centrare
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
    return Container(
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
