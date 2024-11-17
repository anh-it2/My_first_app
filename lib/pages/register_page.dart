import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_service.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/components/my_button.dart';


class RegisterPage extends StatefulWidget {
   RegisterPage({super.key, required this.onTap});
   void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final TextEditingController _emailController = TextEditingController();

   final TextEditingController _pwController = TextEditingController();

   final TextEditingController _confirmpwController = TextEditingController();

  void  register(BuildContext context) async{
    final _auth = AuthService();
    if(_pwController.text == _confirmpwController.text){
      try{
        await _auth.signUpWithEmail(_emailController.text, _pwController.text);
      }on FirebaseAuthException catch(e){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.message!),
          ),
        );
      }
    }
    else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match!"),
        )
      );
    }
  }
  bool showPass = true;
  bool showConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ListView(

          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Icon(
                Icons.person_add_alt_1,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 15,),
            //text
            Center(
              child: Text(
                'Welcome to my app',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 28,
                ),
              ),
            ),

            SizedBox(height: 40,),
            Center(
              child: Text(
                'Let create to your account',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 30,),

            MyTextfield(
              hintText: "user",
              icon: Icons.email_outlined,
              security: false,
              controller: _emailController,
            ),

            SizedBox(height: 10,),
            MyTextfield(
              hintText: "password",
              icon: Icons.lock_outline,
              security: showPass,
              controller: _pwController,
              onTap: (){
                setState(() {
                  showPass = !showPass;
                });
              },
            ),

            SizedBox(height: 10,),
            MyTextfield(
              hintText: "confirn password",
              icon: Icons.lock_outline,
              security: showConfirm,
              controller: _confirmpwController,
              onTap: (){
                setState(() {
                  showConfirm = !showConfirm;
                });
              },
            ),

            SizedBox(height: 30),
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 18,

                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
