
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:myapp/pages/home_screen.dart';
class Views extends StatelessWidget {

   Views({super.key,

   });

  @override
  Widget build(BuildContext context) {
    return SafeArea( child: Stack(
      children: [
        PageView(
          children: [
            HomeScreen(),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    AntDesign.like1,
                    color: Colors.white,
                  ),
                   FloatingActionButton(
                    backgroundColor: Colors.orangeAccent,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Feature has not been updated yet",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                  Icon(
                    AntDesign.user,
                    color: Colors.white,
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    ),
    );
  }
}
