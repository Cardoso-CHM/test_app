import 'package:flutter/material.dart';
import 'package:test_app/ui/lang/pt_br.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          PtBr.homeTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text(
          PtBr.homeTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
      )
    );
  }
}
