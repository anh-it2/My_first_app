import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/pages/member_data_provider.dart';
import 'package:provider/provider.dart';
import 'auth/login_or_register.dart';
import 'package:myapp/themes/light_mode.dart';
import 'package:myapp/auth/auth_gate.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.setLanguageCode('en');
   runApp(MyApp());
}

class MyApp extends StatelessWidget {

    MyApp({super.key,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode,
    );
  }
}



