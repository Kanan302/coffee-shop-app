import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  final List<Coffee> _shop = [
    Coffee(
      name: "Cappucino", 
      prices: {"small": "5.80 ₼", "medium": "6.80 ₼", "large": "7.80 ₼"},
      imagePath: "images/cappucino.jpeg"
    ),
    Coffee(
      name: "Espresso", 
      prices: {"medium": "4.50 ₼"},
      imagePath: "images/espresso.jpeg"
    ),
    Coffee(
      name: "Americano", 
      prices: {"small": "5.50 ₼", "medium": "5.90 ₼", "large" : "6.90 ₼"},
      imagePath: "images/americano.jpg"
    ),
    Coffee(
      name: "Latte", 
      prices: {"small": "5.80 ₼", "medium": "6.80 ₼", "large": "7.80 ₼"},
      imagePath: "images/latte.jpeg"
    ),
    Coffee(
      name: "Mocha", 
      prices: {"small": "7.20 ₼", "medium": "8.20 ₼", "large": "9.20 ₼"},
      imagePath: "images/mocha.jpeg"
    ),
    Coffee(
      name: "Hot Chocolate", 
      prices: {"medium": "6.30 ₼", "large": "7.30 ₼"},
      imagePath: "images/hot-chocolate.jpeg"
    ),
    Coffee(
      name: "Raf Coffee", 
      prices: {"small": "7.10 ₼", "medium": "8.10 ₼", "large": "9.10 ₼"},
      imagePath: "images/raf-coffee.jpg"
    ),
  ];

  
  List <Coffee> _userCart = [];
  
  List <Coffee> get coffeeShop => _shop;

  List <Coffee> get userCart => _userCart;

  Map<String, String> getCoffeePrices(String coffeeName) {
    final coffee = _shop.firstWhere((element) => element.name == coffeeName);
    return coffee.prices;
  }

  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemToCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }

}