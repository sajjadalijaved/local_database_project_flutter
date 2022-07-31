import 'package:flutter/material.dart';
import 'package:local_database1_project/routes/myroutes.dart';

import 'screens/insertion_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: MyRoute.buildPage,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InsertionPage(),
    );
  }
}
