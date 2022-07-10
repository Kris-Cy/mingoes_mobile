import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Pages/emergency_second_page.dart';
import 'package:ndialog/ndialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';




import 'home.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  Location location = new Location();
  late LocationData _locationData;
  FirebaseDatabase database = FirebaseDatabase.instance;

  void sendReport() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    DatabaseReference ref = FirebaseDatabase.instance.ref('report_points/$now');
    _locationData = await location.getLocation();
    String lat = _locationData.latitude.toString();
    String lon = _locationData.longitude.toString();

    await ref.set({
      'point': '$lat,$lon'
    });
  }


  @override
  void initState() {
    super.initState();
  }

  void showAlertDialog () async {
    await Alert(
      context: context,
      type: AlertType.warning,
      title: "SEND ALERT",
      desc: "Do you need to alert Security?",
      buttons: [
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        ),
        DialogButton(
          child: Text(
            "Nah I'm good",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 40),
                  child: Icon(
                    CupertinoIcons.exclamationmark,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                Container(
                  child: Text(
                    "SEND ALERT?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Do you need to send an alert to security?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.3,
                      ),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                    onPressed: () {
                      sendReport();
                      print('Alert Send');
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Alert Sent",
                        desc: "Help is coming",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                      // Navigator.push(context, new MaterialPageRoute(builder: (context) => EmergencySecondPage()));
                    },
                    child: Text(
                      "YES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.3,
                    ),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    onPressed: () {
                      print('Alert dont send');
                      // Navigator.push(context, new MaterialPageRoute(builder: (context) => EmergencySecondPage()));
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No, I'm okay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
