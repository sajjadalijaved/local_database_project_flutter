import 'package:flutter/material.dart';

import '../database/student_provider.dart';
import '../model/student_model.dart';
import 'view_page.dart';

class InsertionPage extends StatelessWidget {
  static const String pageName = 'insertion page';
  final TextEditingController textEditingControllerName =
      TextEditingController();
  final TextEditingController textEditingControllerRollNo =
      TextEditingController();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  InsertionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: height * .1,
                ),
                SizedBox(
                  height: height * .12,
                  child: TextField(
                    controller: textEditingControllerRollNo,
                    decoration: InputDecoration(
                        labelText: 'RollNo',
                        hintText: 'Please Enter RollNo',
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.amber,
                                style: BorderStyle.solid))),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                SizedBox(
                  height: height * .12,
                  child: TextField(
                    controller: textEditingControllerName,
                    decoration: InputDecoration(
                        labelText: 'name',
                        hintText: 'Please Enter Your Name',
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.amber,
                                style: BorderStyle.solid))),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                SizedBox(
                  height: height * .12,
                  child: TextField(
                    controller: textEditingControllerEmail,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Please Enter Your Email',
                        labelStyle: const TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.amber,
                                style: BorderStyle.solid))),
                  ),
                ),
                SizedBox(
                  height: height * .1,
                  child: ElevatedButton(
                      onPressed: () async {
                        String name = textEditingControllerName.text;
                        String rollNo = textEditingControllerRollNo.text;
                        String email = textEditingControllerEmail.text;
                        textEditingControllerName.clear();
                        textEditingControllerRollNo.clear();
                        textEditingControllerEmail.clear();

                        bool isInsert = await insertData(
                          StudentModel(
                              name: name,
                              rollNo: int.parse(rollNo),
                              email: email),
                        );

                        if (isInsert) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$isInsert')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$isInsert')));
                        }
                      },
                      child: const Text('Submit')),
                ),
                SizedBox(
                  height: height * .46,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, ViewPage.pageName, arguments: null);
          },
          child: const Text('View'),
        ));
  }
}
