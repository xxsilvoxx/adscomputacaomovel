import 'package:flutter/material.dart';
import 'package:routers/pages/first_page.dart';
import 'package:routers/pages/second_page.dart';
import 'package:routers/router_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/first-page',
      onGenerateRoute: RouteGenerator.generateRouter,
    );
  }
}
