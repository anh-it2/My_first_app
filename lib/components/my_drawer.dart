import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_gate.dart';
import 'package:myapp/auth/login_or_register.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/setting_page.dart';
import 'package:myapp/auth/auth_service.dart';
class MyDrawer extends StatelessWidget {
  final String name;
  final String email;
   MyDrawer({super.key, required this.name, required this.email});
  void logout(BuildContext context){
    final _auth = AuthService();
    _auth.signOut();
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => AuthGate())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child:ListView(

       children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             UserAccountsDrawerHeader(
               accountName: Text(name,
                 style: TextStyle(
                   fontSize: 20,
                 ),
               ),
               accountEmail: Text(email,
                 style: TextStyle(
                   fontSize: 16,
                 ),
               ),
               currentAccountPicture: CircleAvatar(
                 backgroundColor: Theme.of(context).colorScheme.primary,
                 child: Icon(
                   Icons.person,
                   color: Theme.of(context).scaffoldBackgroundColor,
                   size: 60,
                 ),
               ),
               decoration: BoxDecoration(
                 color: Theme.of(context).colorScheme.primaryContainer,
               ),
             ),

             Padding(
               padding: const EdgeInsets.only(left: 25),
               child: ListTile(
                 title: Text("H O M E"),
                 leading: Icon(Icons.home),
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => HomePage(),
                     )
                   );
                 }
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 25),
               child: ListTile(
                 title: Text("S E T T I N G"),
                 leading: Icon(Icons.settings),
                 onTap: (){
                   // Navigator.pop(context);

                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => SettingPage())
                   );
                 },
               ),
             ),
           ],
         ),
         Padding(
           padding: const EdgeInsets.only(left: 25, bottom: 25),
           child: ListTile(
             title:Text("L O G  O U T"),
             leading: Icon(Icons.logout),
             onTap: () => logout(context),
           ),
         ),
       ],

      ),
    );
  }
}
