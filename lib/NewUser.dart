import 'package:flutter/material.dart';
import 'package:util_app/HomeScreen.dart';

class NewUser extends StatelessWidget {
  final Function(String, String, String) createUserProfile;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  NewUser(this.createUserProfile, {Key?key}) : super(key:key);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 204, 206, 206),
              Color.fromARGB(255, 149, 184, 201),
              Color.fromARGB(255, 198, 141, 255),
              Color.fromARGB(255, 187, 255, 212),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),),
          
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            shadowColor: Color.fromARGB(255, 139, 18, 183),
            elevation: 9,
            
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical:7),
            color: Color.fromARGB(116, 169, 255, 244),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical:15.0),
                  child: TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Name', hintText: 'Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:45.0, vertical:15.0),
                  child: TextField(
                    controller: emailController,
                    decoration:
                        const InputDecoration(labelText: 'Email', hintText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                        labelText: 'Phone Number', hintText: 'Phone Number'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final email = emailController.text;
                    final phoneNumber = phoneNumberController.text;
          
                    createUserProfile(name, email, phoneNumber);
          
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                  child: const Text('Save Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
