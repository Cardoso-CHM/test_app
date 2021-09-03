import 'package:flutter/material.dart';
import 'package:test_app/database/app_db.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/ui/theme/light_theme.dart';
import 'package:test_app/ui/page/login.dart';
import 'package:test_app/ui/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? loggedUser;

  Future<bool> _hasLoggedUser() async {
    loggedUser = await AppDB.instance.getLoggedUser();

    return loggedUser != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: lightTheme(),
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
              future: _hasLoggedUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return loggedUser != null ? Home() : Login();
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
