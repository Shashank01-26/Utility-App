// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:util_app/ImageArea.dart';
// // import 'package:util_app/VideoScreen.dart';
// import 'package:util_app/audioScreen.dart';

// class HomeScreen extends StatelessWidget {
//   static const String routeName = '/home';

//   const HomeScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final _preferences = SharedPreferences.getInstance();

//     final name = _preferences.getString('name');
//     final email = _preferences.getString('email');
//     final phoneNumber = _preferences.getString('phoneNumber');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Utility App"),
//         backgroundColor: Colors.tealAccent,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: FutureBuilder<SharedPreferences>(
//           future: SharedPreferences.getInstance(),
//           builder: (context, snapshot){
//             if (snapshot.connectionState == ConnectionState.waiting){
//               return CircularProgressIndicator();
//             } else if(snapshot.hasData){
//               final name = snapshot.data!.getString('name');
//               final email = snapshot.data!.getString('email');
//               final phoneNumber = snapshot.data!.getString('phoneNumber');
//             }
//           }
//         )
//         );
//          Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Name: $name'),
//             const Text('Email: $email'),
//             const Text('Phone Number: $phoneNumber'),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     Navigator.pushNamed(context, ImageArea.routeName);
//                   //   },
//                   //   child: Text("View Images"),
//                   // ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     Navigator.pushNamed(context, VideoScreen.routeName);
//                   //   },
//                   //   child: Text("Tap to Play Video"),
//                   // ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, AudioScreen.routeName);
//                     },
//                     child: Text("Tap to Play audio"),
//                   ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     Navigator.pushNamed(context, PdfScreen.routeName);
//                   //   },
//                   //   child: Text("Open PDF Viewer"),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         );

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:util_app/VideoScreen.dart';
// import 'package:util_app/ImageArea.dart';
// import 'package:util_app/VideoScreen.dart';
import 'package:util_app/audioScreen.dart';
import 'package:util_app/ImageScreen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _preferences = SharedPreferences.getInstance();

    // final name = _preferences.getString('name');
    // final email = _preferences.getString('email');
    // final phoneNumber = _preferences.getString('phoneNumber');

    return Scaffold(
      appBar: AppBar(
        title: Text("Utility App"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final name = snapshot.data!.getString('Name');
              final email = snapshot.data!.getString('Email');
              final phoneNumber = snapshot.data!.getString('PhoneNumber');
              print(name);
              print(email);
              print(phoneNumber);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $name'),
                  Text('Email: $email'),
                  Text('Phone Number: $phoneNumber'),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AudioScreen.routeName);
                          },
                          child: Text("Tap to Play audio"),
                        ),


                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ImageScreen.routeName);
                          },
                          child: Text("Tap to Open Image"),
                        ),

                        
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoScreen(VideoUrl: Uri.parse('assets/movie.mp4')),
                              ),
                            );
                          },
                          child: Text("Tap to Play Video"),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Text("Error retrieving shared preferences");
            }
          },
        ),
      ),
    );
  }
}
