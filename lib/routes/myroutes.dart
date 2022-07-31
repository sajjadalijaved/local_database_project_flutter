import 'package:flutter/material.dart';
import 'package:local_database1_project/screens/insertion_page.dart';
import 'package:local_database1_project/screens/update_page.dart';
import 'package:local_database1_project/screens/view_page.dart';

class MyRoute {
  static Route<dynamic> buildPage(RouteSettings settings) {
    switch (settings.name) {
      case InsertionPage.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => InsertionPage(), settings: settings);
        }
      case UpdatePage.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => UpdatePage(), settings: settings);
        }
      case ViewPage.pageName:
        {
          return MaterialPageRoute(
              builder: (context) => const ViewPage(), settings: settings);
        }
      default:
        {
          return MaterialPageRoute(
              // ignore: avoid_unnecessary_containers
              builder: (context) => Container(
                    child: const Text('Page not found'),
                  ));
        }
    }
  }
}
