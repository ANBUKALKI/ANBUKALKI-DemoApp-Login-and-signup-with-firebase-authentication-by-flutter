import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:AppBar(
        title: Text("Zchat"),
        automaticallyImplyLeading: false, /* This code used for hide or remove the arrowmark from the home page */
       
      ),
      body: Center(
        child: TextButton(
          onPressed: ()async{
            _auth.signOut();
            Navigator.pop(context);
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}

