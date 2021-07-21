import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gits/Controller/myController.dart';
import 'package:intl/intl.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.quest, required this.title})
      : super(key: key);

  final int quest;
  final String title;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final myContoller = Get.put(MyContoller());
  final TextEditingController helloworld = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ampm = new DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title}'),
        ),
        body: IndexedStack(
          index: widget.quest,
          children: [
            menu1(),
            menu2(),
            menu3(),
            menu4(),
            menu5(),
          ],
        ));
  }

  var timetime;

  Widget menu5() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                '${myContoller.num2.value}',
                style: TextStyle(fontSize: 50),
              )),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: helloworld,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'ex: Katak di balik kataK',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(),
              ),
            ),
            onSubmitted: (n) {
              palindrom();
            },
          ),
          SizedBox(
            height: 30,
          ),
          MyContoller.btn(
            'Submit',
            Colors.red,
            () {
              palindrom();
            },
          ),
        ],
      ),
    );
  }

  Widget menu4() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                '${myContoller.num2.value}',
                style: TextStyle(fontSize: 50),
              )),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: helloworld,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'ex: Aplikasi',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(),
              ),
            ),
            onSubmitted: (n) {
              reversedKata(n);
            },
          ),
          SizedBox(
            height: 30,
          ),
          MyContoller.btn(
            'Submit',
            Colors.red,
            () {
              reversedKata(helloworld.text);
            },
          ),
        ],
      ),
    );
  }

  Widget menu3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          timetime == null
              ? Text('')
              : Text(
                  ampm.format(timetime),
                  style: TextStyle(fontSize: 50),
                ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            minWidth: double.maxFinite,
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.time),
                SizedBox(
                  width: 5,
                ),
                Text('set waktu'),
              ],
            ),
            onPressed: () => showCupertinoModalPopup(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  actions: [
                    SizedBox(
                      height: 180,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (time) {
                          setState(
                            () {
                              timetime = time;
                              print(time);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Done')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menu2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${emailController.text}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'ex: wahyu@untag-sby.id / wahyu@untag-sby.co.id',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(),
              ),
            ),
            onSubmitted: (n) {
              emailValidator(n);
            },
          ),
          SizedBox(
            height: 30,
          ),
          MyContoller.btn(
            'Submit',
            Colors.red,
            () {
              emailValidator(emailController.text);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget menu1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                '${myContoller.num1.value}',
                style: TextStyle(fontSize: 50),
              )),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: helloworld,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'ex: 3',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(),
              ),
            ),
            onSubmitted: (n) {
              hellodivider(n);
            },
          ),
          SizedBox(
            height: 30,
          ),
          MyContoller.btn(
            'Submit',
            Colors.red,
            () {
              hellodivider(helloworld.text);
            },
          ),
        ],
      ),
    );
  }

  void hellodivider(String input) {
    var result = myContoller.helloWrld(int.parse(input.trim()));
    myContoller.num1.value = result;
    EasyLoading.showToast(result);
  }

  void emailValidator(String input) {
    var result = myContoller.validate(input);
    EasyLoading.showToast(result.toString());
    setState(() {});
  }

  void reversedKata(String input) {
    var result = input.split('').reversed.join();
    myContoller.num2.value = result;
    EasyLoading.showToast(result);
  }

  void palindrom() {
    var str = helloworld.text.replaceAll('di balik', '');
    print(str);
    var strSplit = str.split("");
    var strReversed = new List.from(strSplit.reversed);
    var strJoin = strReversed.join("");

    var isPalindrom = str == strJoin;
    EasyLoading.showInfo(isPalindrom.toString());
  }
}
