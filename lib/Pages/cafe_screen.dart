import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Data_Models/cafe_menu.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';
import 'package:mingoes_mobile/Util/widgets.dart';

class CafeScreen extends StatefulWidget {
  const CafeScreen({Key? key}) : super(key: key);

  @override
  _CafeScreenState createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: FunctionsAndInfo().getScreenHeight() * 0.595,
      child: Center(
        child:ListView.builder(
            itemCount: cafeMenu.length,
            itemBuilder: (BuildContext context, int index) {
               return cafeMenuCard(
                   context,
                   cafeMenu[index],
               );
            }
        ),
      ),
    );
  }
}
