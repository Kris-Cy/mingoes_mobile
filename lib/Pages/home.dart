import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:location/location.dart';
import 'package:mingoes_mobile/Data_Models/menu_items.dart';
import 'package:mingoes_mobile/Pages/banner_screen.dart';
import 'package:mingoes_mobile/Pages/emergency.dart';
import 'package:mingoes_mobile/Pages/map_screen.dart';
import 'package:mingoes_mobile/Pages/menu_item_screen.dart';
import 'package:mingoes_mobile/Pages/news_story_screen.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';
import 'package:mingoes_mobile/Data_Models/news.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double screenHeight = FunctionsAndInfo().getScreenHeight();
  double screenWidth = FunctionsAndInfo().getScreenWidth();
  Location location = new Location();
  late LocationData _locationData;

  void getLocation () async {
    _locationData = await location.getLocation();
  }

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: screenHeight,
          child: Stack(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      height: screenHeight * 0.55,
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
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.blue.shade600.withOpacity(0.3),
                                            Colors.blue.shade600.withOpacity(0.8)
                                          ],
                                      ),
                                  ),
                                ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.55,
                      width: screenWidth,
                      child: Container(
                          child: Image.asset('assets/icons/ub-logo-white.png'),
                      ),
                    ),
                    // Container(
                    //   height: screenHeight,
                    //   width: screenWidth,
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //           begin: Alignment.topCenter,
                    //           end: Alignment.bottomCenter,
                    //           colors: [Colors.black.withOpacity(0.5), Colors.white.withOpacity(1)])
                    //   ),
                    // ),
                  // Container(
                  //       padding: EdgeInsets.symmetric(vertical: screenHeight * 0.13),
                  //       height: screenHeight * 0.5,
                  //       child: Swiper(
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Container(
                  //             width: screenWidth * 0.8,
                  //             child: Center(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Text(newsStories[index].headline!,
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 25,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     margin: EdgeInsets.only(top: 10),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.circular(30),
                  //                     ),
                  //                     child: MaterialButton(
                  //                         child: Text(
                  //                           "Read More",
                  //                           style: TextStyle(
                  //                             color: Colors.blue[800]
                  //                           ),
                  //                         ),
                  //                         onPressed: (){
                  //                       Navigator.of(context).push(
                  //                         new MaterialPageRoute(
                  //                             builder: (context) => NewsStoryScreen(
                  //                               story: newsStories[index],
                  //                             ),
                  //                         ),
                  //                       );
                  //                     }),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //         itemCount: newsStories.length,
                  //         viewportFraction: 0.8,
                  //         scale: 0.9,
                  //         duration: 1000,
                  //         autoplayDisableOnInteraction: true,
                  //         pagination: SwiperPagination(),
                  //       ),
                  //     ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    height: 60,
                    color: Colors.transparent,
                    child: GestureDetector(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35,
                      ),
                      onTap: () {
                        print('Navigation Button Pressed');
                      },
                    ),
                  ),
                ],
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                height: screenHeight * 0.45,
                child: GridView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: menuList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OpenContainer(
                        transitionType: ContainerTransitionType.fadeThrough,
                        transitionDuration: Duration(milliseconds: 600),
                        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        closedBuilder: (context, VoidCallback openContainer){
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      menuList[index].imageAddress!,
                                    ),
                                    fit: BoxFit.cover
                                ),
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                openContainer();
                                print("Button pressed: "+menuList[index].itemTitle!);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100.withOpacity(0.95),
                                ),
                                padding: EdgeInsets.all(5),
                                alignment: AlignmentDirectional.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.09,
                                      child: Image.asset(menuList[index].iconAddress!,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Text(menuList[index].itemTitle!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        openBuilder: (context, VoidCallback _) {
                          switch(menuList[index].itemTitle!){
                            case "Banner":
                              return BannerScreen();
                              break;
                            case "Map":
                              return MapScreen();
                              break;
                            case "Emergency":
                                return EmergencyScreen();
                                break;
                            default:
                              return MenuItemScreen(
                                title: menuList[index].itemTitle!,
                                description: menuList[index].itemDescription!,
                                imageUrl: menuList[index].imageAddress!,
                                functions: menuList[index].itemFunctions!,
                              );
                          }
                        }
                      );
                      },
                    ),
              ),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 30;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
