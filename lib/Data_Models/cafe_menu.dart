class CafeMenu {
  String? itemName, itemDesc, itemPic, itemDaytime;
  double? itemPrice;
  bool? itemStock;

  CafeMenu(this.itemName, this.itemDesc, this.itemDaytime,this.itemPic,
      this.itemPrice, this.itemStock);
}

  List getCafeMenu() {
    return cafeMenu;
  }

  List<CafeMenu> cafeMenu =[
    new CafeMenu("Omelet", "It's an egg omelet with stuff thrown in; can have added ham and cheese and stuff", "Breakfast", "assets/images/cafe_items/omelette.jpeg", 3.50, true),
    new CafeMenu("Tuna and Grits", "Tuna and Grits! Is it possible to imagine of a more Bahamian breakfasts?", "Breakfast", "assets/images/cafe_items/tuna_grits.jpeg", 3.00, true),
    new CafeMenu("Pancakes", "Her: \"What's going on here?\" Him: \"BREKFUSS\"", "Breakfast", "assets/images/cafe_items/pancakes.jpeg", 4.50, true),
    new CafeMenu("Cheeseburger", "Is this high quality beef? You bet!", "Lunch", "assets/images/cafe_items/cheeseburger.jpeg", 4.50, true),
    new CafeMenu("Chicken and Fries", "Fried chicken wings and french fries. Can you think of anything else when it's lunch time?", "Lunch", "assets/images/cafe_items/chicken_fries.jpeg", 4.00, true),
    new CafeMenu("Baked Chicken and Rice", "Now this is some at home class right here! Baked chicken and rice; dads everywhere will love it", "Dinner", "assets/images/cafe_items/baked_chicken.jpeg", 6.00, true),
    new CafeMenu("Fish and Fries", "It's Chewsday, innit? Want a spot of fish 'n' chips and a bo'o o wa'uh for supper tea, mate?", "Dinner", "assets/images/cafe_items/fish_fries.jpeg", 7.00, false),
    new CafeMenu("Philly Cheesesteak", "Classic Philly Cheesesteak slamwich, Philly, Cheesy, Steaky, mmmmm", "Lunch", "assets/images/cafe_items/philly_cheesesteak.jpeg", 6.50, false),
    new CafeMenu("Water", "Bottled Water. You've heard of it", "Drink", "assets/images/cafe_items/water.jpeg", 5.50, true),
    new CafeMenu("Soda", "Bottled Soda. All the flavors. Even the Spanish ones", "Drink", "assets/images/cafe_items/soda.jpeg", 5.50, true),
    new CafeMenu("Gatorade", "Gotta get them electrolytes up boi. All the flavors.", "Drink", "assets/images/cafe_items/gatorade.jpeg", 2.00, true),
    new CafeMenu("Vitamin Water", "For the people that think they're better than Gatorade. All the flavors", "Drink", "assets/images/cafe_items/vitamin_water.jpeg", 2.50, true),
    ];
