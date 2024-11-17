import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/pages/member_data_provider.dart';
import 'package:myapp/pages/utils.dart';
import 'package:myapp/pages/display_screen.dart';
import 'package:provider/provider.dart';
class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  Uint8List? _image;
  String _name = "";
  String _dev = "";
  String _studentID = "";
  String _phonenumbers = "";
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _devcontroller = TextEditingController();
  final TextEditingController _studentIDcontroller = TextEditingController();
  final TextEditingController _phonenumbercontroller = TextEditingController();
  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  void saveUserData(String name, String dev, String studentID, Uint8List? image, String phone) async{
    String uid = "";
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      uid = user.uid;
    }
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      "name": name,
      "dev": dev,
      "studentID": studentID,
      "image": image != null ? base64Encode(image): null,
      "phone number": phone,
    });
  }
  void loadUserData() async{
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if(user != null){
      uid = user.uid;
    }

    DocumentSnapshot userDocument = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if(userDocument.exists){
     setState(() {
       _name = userDocument['name'];
       _studentID = userDocument['studentID'];
       _dev = userDocument['dev'];
       _image = userDocument['image'] != null ? Uint8List.fromList(base64Decode(userDocument['image'])) : null;
       _phonenumbers = userDocument['phone number'];
       _namecontroller.text = _name;
       _studentIDcontroller.text = _studentID;
       _devcontroller.text = _dev;
       _phonenumbercontroller.text = _phonenumbers;
     });
    }
  }
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    loadUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        title: Text('Profile Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              size: 35,
            ),
          )
        ],
      ),
      drawer: MyDrawer(name: _name,email: user!.email!,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                        : CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage('asset/avart.png'),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo),
                      ),
                      bottom: -10,
                      left: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _phonenumbercontroller,
                  decoration: InputDecoration(
                    labelText: 'Phone Numbers',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _devcontroller,
                  decoration: InputDecoration(
                    labelText: 'dev',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _studentIDcontroller,
                  decoration: InputDecoration(
                    labelText: 'studentID',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: (){
                     _name = _namecontroller.text;
                     _dev = _devcontroller.text;
                     _studentID = _studentIDcontroller.text;
                     _phonenumbers = _phonenumbercontroller.text;

                     saveUserData(_name, _dev, _studentID, _image, _phonenumbers);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Successed"),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Save',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayScreen(
                          name: _name,
                          dev: _dev,
                          studentID: _studentID,
                          image: _image,
                          phonenumbers: _phonenumbers,
                        ),
                      )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Show Information",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Feature has not been updated yet",
                          textAlign: TextAlign.center,
                        )
                      )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Send Information",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
