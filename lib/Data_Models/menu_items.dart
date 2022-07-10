import 'package:flutter/material.dart';

class MenuItems{
  String? itemTitle, itemDescription;
  String? imageAddress, iconAddress;
  List<MenuItemFunctions>? itemFunctions;

  MenuItems(this.itemTitle, this.itemDescription, this.imageAddress, this.iconAddress, this.itemFunctions);
}

class MenuItemFunctions{
  String? itemFunction;
  IconData? functionIcon;
  
  MenuItemFunctions(this.itemFunction, this.functionIcon);
}

List<MenuItems> menuList = [
  new MenuItems("Banner", "Access Banner", "assets/images/ub_jacket.jpeg", "assets/icons/banner.png", [
    new MenuItemFunctions("Register for classes", Icons.app_registration),
    new MenuItemFunctions("Check grades", Icons.grade),
    new MenuItemFunctions("Class schedule", Icons.date_range),
    new MenuItemFunctions("Check balance", Icons.account_balance_wallet),
  ]),
  new MenuItems("Map", "Check out the campus", "assets/images/ub_building.jpeg", "assets/icons/map.png", [
    // new MenuItemFunctions("Location of campus", Icons.map),
    // new MenuItemFunctions("Location of academic units", Icons.school),
    // new MenuItemFunctions("Location of offices", Icons.apartment),
    // new MenuItemFunctions("Location of amenities", Icons.food_bank),
  ]),
  // new MenuItems("Cafe", "Check out the food", "assets/images/ub_food.jpeg", [
  // ]),
  new MenuItems("Events", "Keep up with campus events", "assets/images/ub_flag.jpeg", "assets/icons/events.png",[
  ]),
  // new MenuItems("Updates", "Stay up to date with UB news", "assets/images/ub_people.jpeg", [
  // ]),
  new MenuItems("Social Media", "Connect with us", "assets/images/ub_students.jpeg", "assets/icons/sm.png",[
    new MenuItemFunctions("Facebook", Icons.facebook),
    new MenuItemFunctions("Instagram", Icons.camera_enhance),
  ]),
  new MenuItems("Emergency", "Access UB emergency contacts", "assets/images/ub_nursing.png", "assets/icons/emergency.png", [
    new MenuItemFunctions("Panic Button", Icons.assignment_late),
    new MenuItemFunctions("Campus Police", Icons.local_police),
    new MenuItemFunctions("Nurse", Icons.healing),
    new MenuItemFunctions("Dr. Bettin", Icons.health_and_safety),
  ]),
  // new MenuItems("Live Chat", "Communicate with other UB students", "assets/images/main.png", "assets/icons/chat.png", []),
  // new MenuItems("News", "Stay... more up to date with UB news?", "assets/images/ub_american_corner.jpeg", []),
  // new MenuItems("UB Deals", "Feel like saving money?", "assets/images/ub_mingo.jpeg", []),
  new MenuItems("About", "Learn more", "assets/images/ub_american_corner.jpeg", "assets/icons/info.png", [
    new MenuItemFunctions("Website", Icons.web),
    new MenuItemFunctions("University Policies", Icons.contact_support),
    new MenuItemFunctions("Directory", Icons.contact_page),
  ]),
];