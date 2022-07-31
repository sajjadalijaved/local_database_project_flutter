import 'package:flutter/material.dart';
import 'package:local_database1_project/database/student_provider.dart';

import '../model/student_model.dart';

class UpdatePage extends StatelessWidget {
  static const String pageName = 'update page';
  final TextEditingController textEditingControllerName =
      TextEditingController();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  StudentModel? studentModel;
  UpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    studentModel = ModalRoute.of(context)!.settings.arguments as StudentModel;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * .27,
              ),
              SizedBox(
                height: height * .12,
                child: TextField(
                  controller: textEditingControllerName,
                  decoration: InputDecoration(
                      labelText: 'Name',
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
                  keyboardType:TextInputType.emailAddress,
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
                      String email = textEditingControllerEmail.text;
                      textEditingControllerName.clear();
                      textEditingControllerEmail.clear();
                      bool result = await updateData(StudentModel(
                          name: name,
                          rollNo: studentModel!.rollNo,
                          email: email));

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$result')));
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
    );
  }
}
