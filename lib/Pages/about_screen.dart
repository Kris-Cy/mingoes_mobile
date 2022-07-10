import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height: FunctionsAndInfo().getScreenHeight() * 0.59,

      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 5, 5),
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                  ),

                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print('Website Button Pressed');
                      _launchUrl('https://www.ub.edu.bs');
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/ub_logo.jpeg'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.6)],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Website',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      print('Directory button pressed');
                      _launchUrl('https://www.ub.edu.bs/wp-content/uploads/2019/01/Employee-Directory-Spring-2019.pdf');
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/portia.jpg'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.6)],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Directory',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 5, 5),
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print('University Policies Button Pressed');
                      _launchUrl("https://www.ub.edu.bs/about-us/ub-policies");
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/cob.jpeg'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.6)],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'University Policies',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  void _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(
          uri,
          mode: LaunchMode.externalApplication
      );
    }else {
      throw 'Could not launch $url';
    }
  }
}
