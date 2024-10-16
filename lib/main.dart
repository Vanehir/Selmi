import 'package:flutter/material.dart';
import 'package:prove/Screens/Home_Screen.dart';
import 'package:prove/Screens/Register_main_screen.dart';
import 'package:prove/ScreensAdmin/Product_main_screen_admin.dart';
import 'package:prove/ScreensGuest/Qr_scan_main_screen_guest.dart';
import 'package:prove/Colors/color_palette.dart';
import 'package:prove/Screens/Document_main_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'model/Object_class.dart';

void main() {

  runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (_) => ItemProvider()),
       ],
       child: MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),

        )
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _passwordInput = TextEditingController(); // recupera l'imput della password dal TextField
  final TextEditingController _usernameInput = TextEditingController(); // recupera l'imput della username dal textField
  final String vaule = 'icts'; // Il valore user
  final String AdminValue = 'admin';
  bool _obscureText = true; // Controlla se il testo è oscurato o no

  void _checkInput() {
    if (_usernameInput.text == vaule &&
        _passwordInput.text == vaule) {
      // Naviga verso la nuova pagina senza possibilità di tornare indietro
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    else if (_usernameInput.text == AdminValue &&
        _passwordInput.text == AdminValue) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductMainScreenAdmin()),
      );
    }
    else {
      // Mostra un messaggio di errore se le credenziali sono errate
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username o Password non validi')),
      );
    }
  }


    void _login() {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    }

    void _register() {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterMainScreen()));
      });
    }
    void _see() {
      setState(() {
        _obscureText = !_obscureText; // Cambia lo stato della visibilità
      });
    }

    void _skippa(){
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const QrScanMainScreenGuest()));
      });
    }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: false,
          body: SingleChildScrollView( // sposta tutti i child che ha al suo interno per fare spazio alla tastiera al momento dell'uso
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,),
                  const Text('Selmi', style:
                  TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 50
                  ),),  // Selmi
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2,),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    decoration: ShapeDecoration(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2,
                                color: primary,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    child: TextField(
                      autofocus: false,
                      controller: _usernameInput,
                      style: const TextStyle(
                          color: primary,
                          fontSize: 23
                      ),
                      decoration: const InputDecoration(
                        hintText: ' Username',

                      ),
                    ),
                  ), // input username
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    decoration: ShapeDecoration(
                        color: neutral,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2,
                                color: primary,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    child: TextField(
                      obscureText: _obscureText,
                      controller: _passwordInput,
                      style: const TextStyle(
                          color: Color(0xFF25344D),
                          fontSize: 23
                      ),
                      decoration: InputDecoration(
                        hintText: ' Password',
                        suffixIcon: IconButton(onPressed: _see, icon: _obscureText ? Image.asset('assets/images/eye_off_icon.png',width: 24,height: 24,) : Image.asset('assets/images/eye_on_icon.png',width: 24,height: 24,)),
                      ),
                    ),
                  ), // input password
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                    color: Colors.transparent,
                    child: ElevatedButton(onPressed: _checkInput,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 2, style: BorderStyle
                                    .solid, color: primary),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        child: const Text("Login", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            color: neutral
                        ),)),
                  ), // login button
                  TextButton(onPressed: () {}, child: const Text("Forgot Password?",
                    style: TextStyle(
                        color: secondary,
                        fontSize: 17
                    ),)), // forgot password
                  TextButton(onPressed: _register, child: const Text("Register",
                    style: TextStyle(
                        color: secondary,
                        fontSize: 17
                    ),)), // password dimanticata
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,),
                  TextButton(onPressed: _skippa, child: const Text("Skip",
                    style: TextStyle(
                        color: secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),)), // Skip login
                ],
              ),
            ),
          ),
          backgroundColor: neutral, // This trailing comma makes auto-formatting nicer for build methods.
        );
      }
    }
