import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Data_Models/news.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';

class NewsStoryScreen extends StatefulWidget {
  const NewsStoryScreen({Key? key, required this.story}) : super(key: key);
  final News story;

  @override
  _NewsStoryScreenState createState() => _NewsStoryScreenState(story);
}

class _NewsStoryScreenState extends State<NewsStoryScreen> {
  News? story;
  _NewsStoryScreenState(this.story);

  double screenHeight = FunctionsAndInfo().getScreenHeight();
  double screenWidth = FunctionsAndInfo().getScreenWidth();


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
            title: Text(""),
          ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/ub_flag.jpeg"
                            ),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.3,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.5)])
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            child: Text(story!.headline!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        story!.story!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
