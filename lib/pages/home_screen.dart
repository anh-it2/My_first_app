import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:myapp/pages/member_detail_page.dart';
class HomeScreen extends StatefulWidget {

   HomeScreen({super.key,

   });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget userWokredWith(String name, String image, Color color, String title,
      VoidCallback onDelete) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          String _job = "Mobile";
          Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                MemberDetailScreen(
                  name: name,
                  image: image,
                  color: color,
                  title: title,
                  job: _job,
                ),
          ));
        },
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: color.withOpacity(0.07),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                      child: Icon(FontAwesome5Regular.edit, size: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete, // Gọi hàm xóa khi nhấn nút
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> members = [
    {
      "name": "Vũ Minh Ánh",
      "image": "asset/ga1.jpg",
      "color": Colors.blueAccent,
      "title": "năm 3"
    },
    {
      "name": "Ông A",
      "image": "asset/ga2.jpg",
      "color": Colors.orangeAccent,
      "title": "năm 2"
    },
    {
      "name": "Bà B",
      "image": "asset/avart.png",
      "color": Colors.redAccent,
      "title": "năm 1"
    },
    {
      "name": "Vũ Minh Ánh",
      "image": "asset/ga2.jpg",
      "color": Colors.blueAccent,
      "title": "năm 2"
    },
    {
      "name": "Vũ Minh Ánh",
      "image": "asset/ga2.jpg",
      "color": Colors.orangeAccent,
      "title": "năm 3"
    },
  ];

  Widget departmentCard(String name, int number, String titile, Color color) {
    return Padding(padding: EdgeInsets.only(right: 20,),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onSecondary,
                ),
              ),
              Text(
                number.toString() + " " + titile,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mobile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5,),

                        Text(
                          "Good Morning, Dear",
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueAccent,
                        image: DecorationImage(
                          image: AssetImage("asset/ga1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      enabled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Feather.search,
                        color: Colors.black,
                        size: 30,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Development",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: (){},
                      child: departmentCard(
                        "Mobile", 12, "members", Colors.blueAccent,
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: (){},
                      child: departmentCard(
                        "Web", 11, "members", Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: (){},
                      child: departmentCard(
                        "AI", 10, "members", Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("You recently worked with",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Icon(Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20,right: 20,bottom:100,),
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return userWokredWith(
                    members[index]['name'],
                    members[index]['image'],
                    members[index]['color'],
                    members[index]['title'],
                        () {
                      // Hàm xóa item
                      setState(() {
                        members.removeAt(
                            index); // Xóa thành viên tại vị trí index
                      });
                    },
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