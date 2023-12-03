import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:coffee_shop_app/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override 
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
  }

  void payNow(){
    // payment system will be here
  }

String calculateTotalSubtitle(List<Coffee> cart) {
  double total = 0;
  for (var coffee in cart) {
    try { 
      var priceWithoutCurrency = coffee.selectedSizePrice.replaceAll('₼', '').trim();
      total += double.parse(priceWithoutCurrency);
    } catch (e) {
      print('Error parsing selectedSizePrice for ${coffee.name}: $e');
    }
  }
  var roundedTotal = double.parse((total).toStringAsFixed(2));
  return 'Total: $roundedTotal ₼';
}


  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Your Cart",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Exit",
                          style: TextStyle(
                            color: (Colors.grey.shade800),
                            fontSize: 22,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut()
                            .then((value) {print("Signed out"); 
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));});}, 
                          icon: Icon(Icons.logout)
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Expanded(
                child:
                  ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];
                    return CoffeeTile(
                      coffee: eachCoffee, 
                      onPressed: () => removeFromCart(eachCoffee), 
                      icon: Icon(Icons.delete), 
                      showSubtitle: true,);
                  }),
              ),
              SizedBox(height: 15),
              Text(
                calculateTotalSubtitle(value.userCart),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25,),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade600,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}

