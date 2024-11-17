import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/login_or_register.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/member_screen.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});


  final String allowedUid = 'tula8oQqjqR3TUqEsGZySyhOeiH3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          User? user = snapshot.data;
          if(user?.uid == allowedUid){
            return HomePage();
          }
          else if(user?.uid != allowedUid && user?.uid != null){
            return MemberScreen();
          }
          return LoginOrRegister();
        },
      ),
    );
  }
}
