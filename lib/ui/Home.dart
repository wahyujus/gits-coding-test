import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gits/Controller/myController.dart';
import 'package:gits/ui/Detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainMenu = [
      'Hello World',
      'Email Validator',
      'Date Format',
      'Reverse Kalimat',
      'Palindrom',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('gits - Coding test'),
      ),
      body: GridView.builder(
        itemCount: mainMenu.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(() => Detail(
                      quest: index,
                      title: mainMenu[index],
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -30,
                      right: -30,
                      child: Icon(
                        Icons.android,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        mainMenu[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
