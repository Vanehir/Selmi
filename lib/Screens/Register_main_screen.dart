import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class RegisterMainScreen extends StatefulWidget {
  const RegisterMainScreen({super.key});

  @override
  State<RegisterMainScreen> createState() => _RegisterMainScreenState();
}

class _RegisterMainScreenState extends State<RegisterMainScreen> {

  final TextEditingController _nameInput = TextEditingController(); // recupera l'imput del name dal TextField
  final TextEditingController _surnameInput = TextEditingController(); // recupera l'imput del surname dal textField
  final TextEditingController _usernameInputR = TextEditingController(); // recupera l'imput del surname dal textField
  final TextEditingController _emailInput = TextEditingController(); // recupera l'imput del surname dal textField
  final TextEditingController _passwordInputR = TextEditingController(); // recupera l'imput del surname dal textField
  final TextEditingController _serialCodeInput = TextEditingController(); // recupera l'imput del surname dal textField

  bool _obscureText = true; // Controlla se il testo è oscurato o no

  void _login() {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
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
      appBar: AppBar(),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Name"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2,
                                  color: Colors.blue,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: TextField(
                        controller: _nameInput,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 23
                        ),
                      ),
                    ), // name input
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    Text("surname"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2,
                                  color: Colors.blue,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: TextField(
                        controller: _nameInput,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 23
                        ),
                      ),
                    ), // surname input
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    Text("username"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2,
                                  color: Colors.blue,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: TextField(
                        controller: _nameInput,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 23
                        ),
                      ),
                    ), // username input
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    Text("email"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2,
                                  color: Colors.blue,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: TextField(
                        controller: _nameInput,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 23
                        ),
                      ),
                    ), // email input
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    Text("password"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2,
                                  color: Colors.blue,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: TextField(
                        obscureText: _obscureText,
                        controller: _passwordInputR,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 23
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: _see, icon: _obscureText ? Image.asset('assets/images/eye_off_icon.png',width: 24,height: 24,) : Image.asset('assets/images/eye_on_icon.png',width: 24,height: 24,)),
                        ),
                      ),
                    ), // input password // password input
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    Text("serial code"),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      decoration: ShapeDecoration(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2,
                                  color: Colors.blue,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: TextField(
                        controller: _nameInput,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 23
                        ),
                      ),
                    ), // serial code input
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  ],
                ),
              ), // input
              Container(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.transparent,
                  child: ElevatedButton(onPressed: _login,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, style: BorderStyle
                                  .solid, color: Colors.blue.shade900),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: Text("Singn Up", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.white
                      ),)),
                ),
              ), // button
              TextButton(onPressed: (){}, child: Text("Register",
                style: TextStyle(
                    color: Colors.indigo.shade700,
                    fontSize: 17
                ),)), // password dimanticata
            ],
          ),
        ),
      ),
    );
  }
}
