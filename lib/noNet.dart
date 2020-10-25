import 'package:flutter/material.dart';

class NoNet extends StatefulWidget {
  @override
  _NoNetState createState() => _NoNetState();
}

class _NoNetState extends State<NoNet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Image.asset(
          "assets/404.png",
          fit: BoxFit.fill,
        ));
  }
}
