import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final IconData iconData;
  final TextEditingController controller;
  final bool typePassword;

  const Input(this.placeholder, this.iconData, this.controller, {this.typePassword = false});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  
  @override
  Widget build(BuildContext context) {
    const layoutStyle = BoxDecoration(
      color: Colors.black12,
      border: Border(
          bottom: BorderSide(
        width: 2,
        color: Color(0xff1C4D87),
      )),
    );

    const hintStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
    );

    const labelStyle = TextStyle(
      color: Color(0xff1C4D87),
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: layoutStyle,
          height: 60.0,
          child: widget.typePassword 
          ? TextField(
            controller: widget.controller,
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.text,
            enableSuggestions: false,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              labelText: widget.placeholder,
              labelStyle: labelStyle,
              border: InputBorder.none,
              prefixIcon: Icon(
                widget.iconData,
                color: Colors.black54,
                size: 28,
              ),
              hintText: widget.placeholder,
              hintStyle: hintStyle,
            ),
          )
        : TextField(
            controller: widget.controller,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              labelText: widget.placeholder,
              labelStyle: labelStyle,
              border: InputBorder.none,
              prefixIcon: Icon(
                widget.iconData,
                color: Colors.black54,
                size: 28,
              ),
              hintText: widget.placeholder,
              hintStyle: hintStyle,
            )
          )
        ),
      ],
    );
  }
}
