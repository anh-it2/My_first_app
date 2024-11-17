import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';

class UpdatePassword extends StatefulWidget {
  UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final TextEditingController _oldPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _cfNewPass = TextEditingController();

  bool showNewPass = true;
  bool showOldPass = true;
  bool showConfirmPass = true;

  Future<void> update() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    if (user != null) {

      if (_newPass.text == _cfNewPass.text) {
        try {
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: _oldPass.text,
          );
          await user.reauthenticateWithCredential(credential);

          await user.updatePassword(_newPass.text);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Updated success!"),
            )
          );
        } catch (e) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Can't update the new password because: $e"),
              )
          );
        }
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("The confirm password isn't correct"),
            )
        );

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Update The New Password',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            MyTextfield(
              hintText: "Old Password",
              controller: _oldPass,
              security: showOldPass,
              icon: Icons.lock_outline,
              onTap: () {
                setState(() {
                  showOldPass = !showOldPass;
                });
              },
            ),
            MyTextfield(
              hintText: "New Password",
              controller: _newPass,
              security: showNewPass,
              icon: Icons.lock_reset_outlined,
              onTap: () {
                setState(() {
                  showNewPass = !showNewPass;
                });
              },
            ),
            MyTextfield(
              hintText: "Confirm New Password",
              controller: _cfNewPass,
              security: showConfirmPass,
              icon: Icons.lock_reset_outlined,
              onTap: () {
                setState(() {
                  showConfirmPass = !showConfirmPass;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: update,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 100, vertical: 20),
                child: Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
