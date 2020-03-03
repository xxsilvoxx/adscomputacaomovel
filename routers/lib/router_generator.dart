import 'package:flutter/material.dart';
import 'package:routers/pages/first_page.dart';
import 'package:routers/pages/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    final argumentos = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/segunda':
        return MaterialPageRoute(
          builder: (_) => SecondPage(
            texto: argumentos,
          ),
        );
      default:
        return _errorRoute(); 
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Página não encontrada'),
        ),
        body: Center(
          child: Text('ERROR...'),
        ),
      );
    });
  }
}
