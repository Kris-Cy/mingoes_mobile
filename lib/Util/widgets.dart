import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mingoes_mobile/Data_Models/cafe_menu.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';

Widget cafeMenuCard(BuildContext context, CafeMenu item){
  String itemStockString = "true";
Color textColor = Colors.green[800]!;
if(item.itemStock!=null){
  itemStockString=item.itemStock!.toString();
}
  if(itemStockString == "true"){
    itemStockString="Available";
  }
  else{
    itemStockString="Not available";
    textColor = Colors.red[800]!;
  }

Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
    ) {
  return SafeArea(
    child: Material(
      child: Container(
          child: Column(
            children: [
              Image(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: AssetImage(
                  item.itemPic!
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                    item.itemName!,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                child: Text(
                  item.itemDaytime!,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  item.itemDesc!,
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "\$"+item.itemPrice!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  itemStockString,
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                  ),
                ),
              ),
            ],
          )
      ),
    ),
  );
}

  return MaterialButton(
    padding: EdgeInsets.zero,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    item.itemPic!,
                  ),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(20),
            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.itemName!
              ),
              Text(
                "\$" + item.itemPrice!.toStringAsFixed(2)
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
                itemStockString,
              style: TextStyle(
                color: textColor
              ),
            ),
          ),
        ],
      ),
    ),

    onPressed: () {
      showFlexibleBottomSheet(
        minHeight: 0,
        initHeight: 0.75,
        maxHeight: 1,
        context: context,
        builder: _buildBottomSheet,
        anchors: [0, 0.5, 1],
      );
    },
  );
}