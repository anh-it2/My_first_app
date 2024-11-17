import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String name;
  final String dev;
  final String studentID;
  final Uint8List? image;
  final String phonenumbers;
   DisplayScreen({super.key,
     required this.name,
     required this.dev,
     required this.studentID,
     required this.image,
     required this.phonenumbers,
   });


  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Information",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: MemoryImage(image!),
                  radius: 80,
                ),
              ),
              Divider(
                height: 60,
                color: Colors.black,
              ),
              // Text('NAME',
              //   style: TextStyle(
              //     color: Theme.of(context).colorScheme.primary,
              //     letterSpacing: 2.0,
              //   ),
              // ),
              // SizedBox(height: 10,),
              Card(
                color: Colors.white,
        
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.person_rounded,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 20,),
                      Text('$name',
                        style: TextStyle(
                          color: Colors.blueAccent[200],
                          letterSpacing: 2.0,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
        
              SizedBox(height: 10,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.school_rounded,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 20,),
                      Text('$studentID',
                        style: TextStyle(
                          color: Colors.blueAccent[200],
                          letterSpacing: 2.0,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.work_history,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 20,),
                      Text('$dev',
                        style: TextStyle(
                          color: Colors.blueAccent[200],
                          letterSpacing: 2.0,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                color: Colors.white,
        
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.phone_android,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 20,),
                      Text('$phonenumbers',
                        style: TextStyle(
                          color: Colors.blueAccent[200],
                          letterSpacing: 2.0,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 5),
                      Text(
                        user?.email ?? "không có email",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
