import 'package:flutter/material.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:provider/provider.dart';
import '../models/coffee_shop.dart';

class SelectSizePage extends StatefulWidget {
  final Coffee coffee;

  SelectSizePage({required this.coffee});

  @override
  State<SelectSizePage> createState() => _SelectSizePageState();
}

class _SelectSizePageState extends State<SelectSizePage> {
  String selectedSize = '';
  Map<String, String> sizePrices = {};

  @override
  void initState() {
    super.initState();
    sizePrices = Provider.of<CoffeeShop>(context, listen: false).getCoffeePrices(widget.coffee.name);
  }

  void addToCart() {
    if (selectedSize == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Please select a size before adding to cart."),
        ),
      );
    } else {
      widget.coffee.selectedSize = selectedSize;
      widget.coffee.selectedSizePrice = sizePrices[selectedSize] ?? '';

      Provider.of<CoffeeShop>(context, listen: false).addItemToCart(widget.coffee);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Successfully added to cart"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff614720),
        title: Text('Select Coffee Size'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50,),
              Text(
                ' ${widget.coffee.name}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                widget.coffee.imagePath,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: sizePrices.keys.map((size) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedSize == size ? Color(0xffD8B660) : Color.fromARGB(255, 181, 136, 63),
                    ),
                    child: Text(
                      size,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 50),
              Text(
                'Price : ${sizePrices[selectedSize] ?? " "}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: addToCart,
                child: Text(
                  "Add to Card",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 181, 136, 63))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
