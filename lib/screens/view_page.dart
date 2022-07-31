import 'package:flutter/material.dart';
import 'package:local_database1_project/database/student_provider.dart';
import 'package:local_database1_project/model/student_model.dart';
import 'package:local_database1_project/screens/update_page.dart';

class ViewPage extends StatefulWidget {
  static const String pageName = 'view page';
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<StudentModel>? models;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future fetch() async {
    var models = await fetchData();
    if (models != null) {
      setState(() {
        this.models = models;
      });
    } else {
      setState(() {
        this.models = [];
      });
    }
  }

  void handleClick(String? data, StudentModel studentModel) async {
    if (data == 'Delete') {
      var res = await deleteData(studentModel);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$res')));
    } else if (data == 'Update') {
      await Navigator.pushNamed(context, UpdatePage.pageName,
          arguments: studentModel);
    }
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: models == null
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return item(models![index], context);
              },
              itemCount: models?.length,
            ),
    );
  }

  Widget item(StudentModel studentModel, BuildContext context) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        child: FittedBox(child: Text(studentModel.rollNo.toString())),
      ),
      title: Text(studentModel.name),
      subtitle: Text(studentModel.email),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          handleClick(value, studentModel);
        },
        itemBuilder: (BuildContext context) {
          return {'Update', 'Delete'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ));
  }
}
