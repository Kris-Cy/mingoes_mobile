import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Data_Models/menu_items.dart';
import 'package:mingoes_mobile/Pages/deals_screen.dart';
import 'package:mingoes_mobile/Pages/map_screen.dart';
import 'package:mingoes_mobile/Pages/social_media_screen.dart';
import 'package:mingoes_mobile/Pages/updates_screen.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';

import 'about_screen.dart';
import 'cafe_screen.dart';
import 'events_screen.dart';
import 'news_screen.dart';

class MenuItemScreen extends StatefulWidget {
  const MenuItemScreen({Key? key, required this.title, required this.description, required this.imageUrl, required this.functions}) :super(key: key);
  final String title;
  final String description;
  final String imageUrl;
  final List<MenuItemFunctions> functions;

  _MenuItemScreenState createState() => _MenuItemScreenState(title, description, imageUrl, functions);
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  String? title, description, imageUrl;
  List<MenuItemFunctions>? functions;
  _MenuItemScreenState(this.title, this.description, this.imageUrl, this.functions);

  late List<String> functionTitles = [];
  late List<IconData> functionIcons = [];
  late Widget pageContent = new Container();

  double screenHeight = FunctionsAndInfo().getScreenHeight();
  double screenWidth = FunctionsAndInfo().getScreenWidth();

  @override
  void initState() {
    for (int i=0; i<functions!.length; i++){
      functionTitles.add(functions![i].itemFunction!);
      functionIcons.add(functions![i].functionIcon!);
    }

    showPageContent(title);

    super.initState();
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
          title: Text(title!),
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                height: screenHeight * 0.6,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                imageUrl!
                            ),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.6,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.5)])
                      ),
                      child: Container(
                        height: FunctionsAndInfo().getScreenHeight() * 0.2,
                        margin: EdgeInsets.only(
                            top: FunctionsAndInfo().getScreenHeight() * 0.15
                        ),
                        child: Text(title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.white.withOpacity(.1),
                      Colors.white.withOpacity(1),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: FunctionsAndInfo().getScreenHeight() * 0.35),
                  child: pageContent
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPageContent(String? title) {
    switch(title){
      case "Map":
        pageContent = new Container(
          child: MapScreen(),
        );
        break;
      case "Cafe":
        pageContent = new Container(
          child: CafeScreen(),
        );
        break;
      case "Events":
        pageContent = new Container(
          child: EventsScreen(),
        );
        break;
      case "Updates":
        pageContent = new Container(
          child: UpdatesScreen(),
        );
        break;
      case "Social Media":
        pageContent = new Container(
          child: SocialMediaScreen(),
        );
        break;
      case "News":
        pageContent = new Container(
          child: NewsScreen(),
        );
        break;
      case "UB Deals":
        pageContent = new Container(
          child: DealsScreen(),
        );
        break;
      case "About":
        pageContent = new Container(
          child: AboutScreen(),
        );
        break;
      default:
        pageContent = new Container(
          height: screenHeight * 0.595,
          child: GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount: 2,
            children: List.generate(functionTitles.length, (index) {
              return MaterialButton(
                onPressed: (){
                  print(functionTitles[index]+" button pressed");
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(functionIcons[index],
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        functionTitles[index],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
    }
  }
}
