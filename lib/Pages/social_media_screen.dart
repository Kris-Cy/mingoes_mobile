import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Data_Models/social_media.dart';
import 'package:mingoes_mobile/Pages/social_media_page_open.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List mediaList = SocialMedia.socialMediaList;
    return Container(
      height: FunctionsAndInfo().getScreenHeight() * 0.595,
      child: GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisCount: 2,
        children: List.generate(mediaList.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: MaterialButton(
              onPressed: (){
                Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context) => OpenSocialMediaPage(
                        url: mediaList[index].mediaUrl,
                        header: mediaList[index].mediaName,
                      ),
                  ),
                );
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(mediaList[index].mediaBackground!),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(30),
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
                          mediaList[index].mediaName!,
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
          );
        }),
      ),
    );
  }
}
