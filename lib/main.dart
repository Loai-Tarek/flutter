import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './pages/proudcts.dart';
import './pages/proudct.dart';
import './pages/proudcts_admin.dart';
import './pages/auth.dart';
void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _proudcts = [];


  void _addproudct(Map<String, dynamic> proudct) {
    setState(() {
      _proudcts.add(proudct);
    });
    print(_proudcts);
  }

  void _deleteProudct(int index) {
    setState(() {
      _proudcts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/proudcts': (BuildContext context) => ProudctsPage(_proudcts),
        '/admin': (BuildContext context) =>
            ProudctsAdminPage(_addproudct, _deleteProudct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'proudct') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProudctPage(
                _proudcts[index]['title'],
                _proudcts[index]['image'],
                _proudcts[index]['price'],
                _proudcts[index]['description']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProudctsPage(_proudcts));
      },
    );
  }
}
