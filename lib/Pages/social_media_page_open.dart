import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenSocialMediaPage extends StatefulWidget {
  const OpenSocialMediaPage({Key? key, required this.header, required this.url}) : super(key: key);
  final String header;
  final String url;

  @override
  _OpenSocialMediaPageState createState() => _OpenSocialMediaPageState(header, url);
}

class _OpenSocialMediaPageState extends State<OpenSocialMediaPage> {
  String? header, url;
  _OpenSocialMediaPageState(this.header, this.url);

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
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
          title: Text(header!),
        ),
        body: Container(
          height:FunctionsAndInfo().getScreenHeight(),
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: url!,
            onPageFinished: (finish) {
              setState(() {
              });
            },
          ),
        ),
      ),
    );
  }
}
