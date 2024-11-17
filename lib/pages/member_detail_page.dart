import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myapp/pages/view_page.dart';

class MemberDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String title;
  final String job;
  const MemberDetailScreen({super.key,
    required this.name,
    required this.image,
    required this.color,
    required this.title,
    required this.job,
  });
  Widget iconContainer(Color color, IconData icon, String title, int number){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.06)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
                icon,
                color: color,
                size: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
      ),
    );
  }
  Widget lastUpdates(String name, String title, String result){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.07),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              name + " " + result,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
          ),
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(job,
                                style:TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 40, ),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blueAccent,
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0.1,
                                blurRadius: 2,
                                offset: Offset(0, 5)
                              ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(title,
                        style: TextStyle(
                          fontSize: 16,
                          
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.65,
                builder: (context,scrollController){
                  return Container(
                    padding: EdgeInsets.only(top:40, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Text(
                            "Stats",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconContainer(
                              Colors.redAccent,
                              Ionicons.heart,
                              "likes",
                              43,
                            ),
                            iconContainer(
                              Colors.deepPurpleAccent.withOpacity(0.5),
                              AntDesign.like1,
                              "thanks",
                              24,
                            ),
                            iconContainer(
                              Colors.blue,
                              Ionicons.ribbon,
                              "credits",
                              24,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Last Updates",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        lastUpdates(
                          name,
                          "General",
                          "good job man"
                        ),
                        lastUpdates(
                          name,
                          "Result",
                          "pass or fail"
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
