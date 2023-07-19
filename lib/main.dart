// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:util_app/ImageArea.dart';
// // import 'package:util_app/VideoScreen.dart';
// // import 'package:util_app/PdfScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:util_app/audioScreen.dart';
// import 'package:util_app/HomeScreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//       routes: {
//         HomeScreen(),
//         // ImageArea.routeName: (context) => ImageArea(),
//         // VideoScreen.routeName: (context) => VideoScreen(),
//         AudioScreen.routeName: (context) => AudioScreen(),
//         // PdfScreen.routeName: (context) => VideoScreen(),
//       },
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// import 'package:audioplayers/audioplayers.dart';
// import 'package:util_app/ImageArea.dart';
// import 'package:util_app/VideoScreen.dart';
// import 'package:util_app/PdfScreen.dart';
import 'package:flutter/material.dart';
import 'package:util_app/audioScreen.dart';
import 'package:util_app/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:util_app/NewUser.dart';
import 'package:util_app/ImageScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _preferences;
  bool _isProfileCreated = false;

  @override
  void initState() {
    super.initState();
    checkUserProfile();
  }

  Future<void> checkUserProfile() async {
    _preferences = await SharedPreferences.getInstance();
    _isProfileCreated = _preferences.getBool("isProfileCreated") ?? false;
    setState(() {});
  }

  void createUserProfile(String name, String email, String phoneNumber) {
    _preferences.setString('Name', name);
    _preferences.setString('Email', email);
    _preferences.setString('PhoneNumber', phoneNumber);
    _preferences.setBool('isProfileCreated', true);
    setState(() {
      _isProfileCreated = true;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isProfileCreated ? HomeScreen() : NewUser(createUserProfile),
      routes:{
        AudioScreen.routeName: (context) => AudioScreen(),
        ImageScreen.routeName: (context) => ImageScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      }
    );
  }
}
