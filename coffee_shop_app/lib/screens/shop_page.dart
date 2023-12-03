import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'select_size_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Coffee> _foundCoffeeList = [];

  @override
  void initState() {
    _foundCoffeeList = Provider.of<CoffeeShop>(context, listen: false).coffeeShop;
    super.initState();
  }

  void _searchFilter(String enteredKeyword) {
    List<Coffee> results = [];

    if (enteredKeyword.isEmpty) {
      results = Provider.of<CoffeeShop>(context, listen: false).coffeeShop;
    } else {
      results = Provider.of<CoffeeShop>(context, listen: false).coffeeShop
          .where((coffee) =>
              coffee.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundCoffeeList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(23),
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                "How would you like your coffee?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: _searchFilter,
                decoration: InputDecoration(
                  labelText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), 
                itemCount: _foundCoffeeList.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = _foundCoffeeList[index];

                  return CoffeeTile(
                    coffee: eachCoffee,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () => _navigateToSelectSizePage(eachCoffee),
                    showSubtitle: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSelectSizePage(Coffee coffee) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectSizePage(coffee: coffee),
      ),
    );
  }
}
