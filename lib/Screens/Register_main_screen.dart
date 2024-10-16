import 'package:flutter/material.dart';
import 'package:prove/Colors/color_palette.dart';
import 'Home_Screen.dart';

class RegisterMainScreen extends StatefulWidget {
  const RegisterMainScreen({super.key});

  @override
  State<RegisterMainScreen> createState() => _RegisterMainScreenState();
}

class _RegisterMainScreenState extends State<RegisterMainScreen> {
  final TextEditingController _nameInput =
      TextEditingController(); // recupera l'input del name dal TextField
  final TextEditingController _surnameInput =
      TextEditingController(); // recupera l'input del surname dal textField
  final TextEditingController _usernameInputR =
      TextEditingController(); // recupera l'input del surname dal textField
  final TextEditingController _emailInput =
      TextEditingController(); // recupera l'input del surname dal textField
  final TextEditingController _passwordInputR =
      TextEditingController(); // recupera l'input del surname dal textField
  final TextEditingController _serialCodeInput =
      TextEditingController(); // recupera l'input del surname dal textField

  bool _obscureText = true; // Controlla se il testo è oscurato o no

  void _login() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  void _see() {
    setState(() {
      _obscureText = !_obscureText; // Cambia lo stato della visibilità
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selmi',
              style: TextStyle(
                fontSize: 24, // Adatta la dimensione del font a tuo piacimento
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sottotitolo',
              style: TextStyle(
                fontSize: 16, // Adatta la dimensione del font a tuo piacimento
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: primario,
        toolbarHeight: 80,
      ),
      //extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  color: primario,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        controller: _nameInput,
                        style: const TextStyle(
                          color: primario,
                          fontSize: 23,
                        ),
                        decoration: const InputDecoration(hintText: "Name"),
                      ),
                    ), // name input
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  color: primario,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        controller: _surnameInput,
                        style: const TextStyle(color: primario, fontSize: 23),
                        decoration: const InputDecoration(hintText: "Surname"),
                      ),
                    ), // surname input
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  color: primario,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        controller: _usernameInputR,
                        style: const TextStyle(color: primario, fontSize: 23),
                        decoration: const InputDecoration(hintText: "Username"),
                      ),
                    ), // username input
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: ShapeDecoration(
                          color: background,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  color: primario,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        controller: _emailInput,
                        style: const TextStyle(color: primario, fontSize: 23),
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                    ), // email input
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  color: primario,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        obscureText: _obscureText,
                        controller: _passwordInputR,
                        style: const TextStyle(color: primario, fontSize: 23),
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: _see,
                              icon: _obscureText
                                  ? Image.asset(
                                      'assets/images/eye_off_icon.png',
                                      width: 24,
                                      height: 24,
                                    )
                                  : Image.asset(
                                      'assets/images/eye_on_icon.png',
                                      width: 24,
                                      height: 24,
                                    )),
                        ),
                      ),
                    ), // input password // password input
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: ShapeDecoration(
                          color: background,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  color: Color(0xFF25344D),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10))),
                      child: TextField(
                        controller: _serialCodeInput,
                        style: const TextStyle(color: primario, fontSize: 23),
                        decoration:
                            const InputDecoration(hintText: "Serial code"),
                      ),
                    ), // serial code input
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ), // input
              Container(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.transparent,
                  child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primario,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color: primario),
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: background,
                        ),
                      )),
                ),
              ), // button
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(color: secondario, fontSize: 20),
                  )), // password dimanticata
            ],
          ),
        ),
      ),
    );
  }
}
