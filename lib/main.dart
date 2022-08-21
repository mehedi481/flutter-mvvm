import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/route_name.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.loginScreen,
      onGenerateRoute: RouteGenerator.getRoute,
      home: const HomeScreen(),
    );
  }
}

