import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:test_app/database/app_db.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/service/user_service.dart';
import 'package:test_app/ui/lang/pt_br.dart';
import 'package:test_app/ui/page/home.dart';
import 'package:test_app/ui/widget/button.dart';
import 'package:test_app/ui/widget/input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;

  Future<Map<String, Object?>> doLogin() async {
    var userService = UserService();
    var email = emailController.text;
    var password = passwordController.text;
    Map<String, Object?> res = Map<String, Object?>();

    try {
      final response = await userService.login(email, password);
      final parsed = json.decode(response.body);
      final status = response.statusCode;

      if (status == 200) {
        final loggedUser = User(
          id: parsed['id'] as String,
          name: parsed['nome'] as String,
          profile: parsed['perfil'] as String,
          token: parsed['token'] as String,
        );

        await AppDB.instance.createUser(loggedUser);
        res['error'] = false;
      } else {
        res['error'] = true;
        res['message'] = parsed['message'];
      }
    } catch (ex) {
      res['error'] = true;
      res['message'] = ex.toString();
    }

    return res;
  }

  Widget loadErroMessage() {
    return errorMessage != null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                right: 12,
                left: 12
              ),
              child: Text(
                errorMessage ?? 'Erro desconhecido!',
                style: TextStyle(
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox(height: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          PtBr.loginTile,
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Input(
                  PtBr.inputEmail,
                  Icons.mail,
                  emailController,
                ),
                SizedBox(height: 12),
                Input(
                  PtBr.inputPassword,
                  Icons.lock,
                  passwordController,
                  typePassword: true,
                ),
                SizedBox(height: 24),
                loadErroMessage(),
                Button(PtBr.buttonLoginLabel, () async {
                  final res = await doLogin();
                  if (res['error'] == false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  } else {
                    setState(() {
                      errorMessage = res['message'] as String;
                    });
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
