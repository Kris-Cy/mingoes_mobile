import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BannerScreen extends StatefulWidget {
  const BannerScreen({Key? key}) : super(key: key);

  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  bool isPageLoaded = false;
  
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Banner"),
        ),
        body: Stack(
          children: [
            Container(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://studentssb-prod.ec.ub.edu.bs/StudentSelfService/",
                onPageFinished: (finish) {
                  setState(() {
                    isPageLoaded = true;
                  });
                },
              ),
            ),
            isPageLoaded ? Stack() : Stack(
                            children: [
                              Image.asset(
                                'assets/images/ub_jacket.jpeg',
                                fit: BoxFit.cover,
                                height: FunctionsAndInfo().getScreenHeight(),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        height: FunctionsAndInfo().getScreenHeight() * 0.05,
                                        width: FunctionsAndInfo().getScreenHeight() * 0.05,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          "Loading Banner...",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                            ],
                          ),
          ],
        ),
      ),
    );
  }

// Container(
//   height: FunctionsAndInfo().getScreenHeight(),
//   child: Stack(
//     children: [
//       Image.asset(
//         'assets/images/ub_jacket.jpeg',
//         fit: BoxFit.cover,
//         height: FunctionsAndInfo().getScreenHeight(),
//       ),
//       Container(
//         color: Colors.black.withOpacity(0.5),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.all(20),
//                 height: FunctionsAndInfo().getScreenHeight() * 0.05,
//                 width: FunctionsAndInfo().getScreenHeight() * 0.05,
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(20),
//                 child: Text(
//                   "Loading Banner...",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ),
//       ),
//     ],
//   ),
// ),
}
