import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});
  static const String routeName = 'assets/images/one.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Image Screen"),
        backgroundColor: Colors.indigo[600],
      ),
      body: Center(
        child: Image.asset('assets/images/one.jpg',
        height: 200,
        width: 200,
        ),
      ),
    );
  }
}
