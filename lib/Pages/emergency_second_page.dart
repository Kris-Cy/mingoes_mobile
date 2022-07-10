import 'package:flutter/material.dart';

import 'home.dart';

class EmergencySecondPage extends StatefulWidget {
  const EmergencySecondPage({Key? key}) : super(key: key);

  @override
  _EmergencySecondPageState createState() => _EmergencySecondPageState();
}

class _EmergencySecondPageState extends State<EmergencySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
          },
        ),
      ),
      body: Container(
        child: Text('Emergency Page 2'),
      ),
    );
  }
}
