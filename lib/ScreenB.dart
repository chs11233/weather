import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget{
  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build called2');
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
      ),
      body: Center(
        child: Text('ScreenB',
        style: TextStyle(
          fontSize: 24
        ),
        ),
      ),
    );
  }
}