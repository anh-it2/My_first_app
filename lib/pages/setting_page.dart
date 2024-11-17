import 'package:flutter/material.dart';
import 'package:myapp/pages/member_screen.dart';
import 'package:myapp/pages/update_password_page.dart';

class SettingPage extends StatelessWidget {
   SettingPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        title: Text("SETTING PAGE",
          style: TextStyle(
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePassword(),
                  )
                );
              },
              child: Container(
                width: double.infinity,
               padding: EdgeInsets.all(20.0),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(12),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.3),
                     spreadRadius: 1,
                     blurRadius: 5,
                     offset: Offset(0, 3),
                   )
                 ]
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Update The New Password',
                     style: TextStyle(
                       fontSize: 18,
                     ),
                   ),
                   Icon(
                     Icons.arrow_forward_ios,
                   )
                 ],
               ),
              ),
            ),

            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberScreen(),
                    )
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Update Information',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
