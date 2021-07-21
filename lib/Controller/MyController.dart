import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyContoller extends GetxController {
  var num1 = ''.obs;
  var num2 = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  static Widget btn(String title, Color color, VoidCallback func) {
    return Container(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          func();
        },
        child: Text(title),
      ),
    );
  }

  String helloWrld(int hello) {
    if (hello % 5 == 0 && hello % 3 == 0) {
      return 'Hello World';
    } else if (hello % 5 == 0) {
      return 'World';
    } else if (hello % 3 == 0) {
      return 'Hello';
    } else {
      return '$hello';
    }
  }

  bool validate(String myEmail) {
    var valid = [];

    myEmail.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      valid.add(character);
    });

    var newValid = [];

    for (var item in valid) {
      if (item != '@') {
        newValid.add(item);
      } else {
        break;
      }
    }

    var concatenate = StringBuffer();

    newValid.forEach((item) {
      concatenate.write(item);
    });

    print(concatenate);

    if (concatenate.length <= 20) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.(id|co.id)+")
          .hasMatch(myEmail);
      return emailValid;
    } else {
      return false;
    }
  }
}
