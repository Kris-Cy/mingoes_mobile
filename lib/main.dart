import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'Util/functions_and_info.dart';
import 'Pages/home.dart';


Future<void> main() async {
  runApp(MyApp());
}

void initialize () async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initialize();
    return MaterialApp(
      title: 'Mingoes Mobile',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mingoes Mobile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool timePassed = false;
  bool showObjects = false;
  Widget primaryWidget = Container();

  @override
  void initState() {
    timePassed = false;
    Timer(Duration(seconds: 3), () {
      setState(() {
        timePassed = true;
        print("Has 3 seconds passed? $timePassed");
      });
    });
    Timer(Duration(seconds: 4), () {
      setState(() {
        primaryWidget = objects();
      });
    });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    FunctionsAndInfo().setScreenSize(
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width
    );

    double screenWidth = MediaQuery.of(context).size.width,
           screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
              Container(
              height: screenHeight,
              width: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/ub_flag.jpeg"
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: screenHeight,
                width: screenWidth,
                child: AnimatedOpacity(
                  opacity: timePassed ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1500),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.3),
                                    Colors.blue.shade600.withOpacity(0.9)
                                  ],
                                ),
                              ),
                              child: primaryWidget,
                            ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              height: timePassed ? screenHeight * 0.35 : screenHeight,
              top: timePassed ? screenHeight * 0.15 : 0.0,
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: screenWidth,
                padding: timePassed ? EdgeInsets.symmetric(vertical: 10, horizontal: 0) : EdgeInsets.zero,
                child: Center(
                  child: BounceIn(
                    child: Image.asset("assets/images/ub-logo.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget objects(){
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
      child: ZoomIn(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.person_alt,
                      color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: TextField(
                          decoration: InputDecoration(
                            labelText: 'UB ID'
                          ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(CupertinoIcons.padlock_solid,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: MaterialButton(
                  onPressed: () {
                    print('Login Button pressed');
                    Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(
                          builder: (context) => Home()
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.3,
                      ),
                    ),
                    child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: MaterialButton(
                        onPressed: () {
                          print('Staff Button pressed');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.3,
                            ),
                          ),
                          child: Text("I'm A Staff Member"),
                        ),
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {
                          print('Guest Button pressed');
                          Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => Home()
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Skip Sign In"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
