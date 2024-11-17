import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_service.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/components/my_button.dart';
class LoginPage extends StatefulWidget {
   LoginPage({super.key, required this.onTap});

   final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   void  login(BuildContext context) async{
     //auth service
     final authService = AuthService();

     if (_emailController.text.isEmpty || _pwController.text.isEmpty) {
       showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: Text("Input Error"),
           content: Text("Please fill out all fields.",
             style: TextStyle(
               fontSize: 18,
             ),
           ),
         ),
       );
       return;
     }

     try{

       await authService.signInWithEmail(_emailController.text, _pwController.text);
     }

     catch(e){
       showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: Text(e.toString()),
         )
       );
     }
   }

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView(

            children: [
              //logo
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Icon(
                  Icons.looks_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              SizedBox(height: 15,),
              //text
              Center(
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 28,
                  ),
                ),
              ),

              SizedBox(height: 40,),
              Center(
                child: Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              //login
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
                security: check,
                controller: _pwController,
                onTap: (){
                  setState(() {
                    check = !check;
                  });
                },
              ),


              SizedBox(height: 30),
              MyButton(
                text: "Login",
                onTap: () => login(context),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register now",
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
      );
  }
}
