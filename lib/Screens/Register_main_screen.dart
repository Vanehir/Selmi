import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home_Screen.dart';

class RegisterMainScreen extends StatefulWidget {
  const RegisterMainScreen({super.key});

  @override
  State<RegisterMainScreen> createState() => _RegisterMainScreenState();
}

class _RegisterMainScreenState extends State<RegisterMainScreen> {
  final TextEditingController _nameInput = TextEditingController();
  final TextEditingController _surnameInput = TextEditingController();
  final TextEditingController _usernameInputR = TextEditingController();
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInputR = TextEditingController();
  final TextEditingController _serialCodeInput = TextEditingController();

  bool _obscureText = true;

  Future<void> _regist() async {
    // Recupera i dati dagli input
    String name = _nameInput.text;
    String surname = _surnameInput.text;
    String username = _usernameInputR.text;
    String email = _emailInput.text;
    String password = _passwordInputR.text;
    String serialCode = _serialCodeInput.text;

    // Naviga alla schermata di Login
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(accesso: 'user', name: name,surname: surname, username: username ,emaiil: email, password: password, serialcode: serialCode),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: ShapeDecoration(
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscureText : false,
        style: TextStyle(color: primary, fontSize: 23),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          suffixIcon: isPassword
              ? IconButton(
            onPressed: _togglePasswordVisibility,
            icon: _obscureText
                ? Image.asset('assets/images/eye_off_icon.png', width: 24, height: 24)
                : Image.asset('assets/images/eye_on_icon.png', width: 24, height: 24),
          )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Column(
            children: [
              _buildInputField(controller: _nameInput, hintText: "Name"),
              const SizedBox(height: 40),
              _buildInputField(controller: _surnameInput, hintText: "Surname"),
              const SizedBox(height: 40),
              _buildInputField(controller: _usernameInputR, hintText: "Username"),
              const SizedBox(height: 40),
              _buildInputField(controller: _emailInput, hintText: "Email"),
              const SizedBox(height: 40),
              _buildInputField(controller: _passwordInputR, hintText: "Password", isPassword: true),
              const SizedBox(height: 40),
              _buildInputField(controller: _serialCodeInput, hintText: "Serial code"),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: _regist,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: primary, width: 2),
                  ),
                ),
                child: Text(
                  "Register now",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200, color: neutral),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
