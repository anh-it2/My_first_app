import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_service.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/pages/view_page.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key,
   });

  void logout(){
    final _auth = AuthService();
    _auth.signOut();
  }
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        title:Text("Home Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(name: "admin", email: user!.email!,),
      body: Views(),
    );
  }
}
