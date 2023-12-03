import 'package:flutter/material.dart';
import 'package:coffee_shop_app/models/coffee.dart';

// ignore: must_be_immutable
class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;
  final bool showSubtitle; 

  CoffeeTile({
    Key? key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
    this.showSubtitle = true, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListTile(
        title: Text(
          coffee.name,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: showSubtitle
            ? Text(
                showSubtitle ? coffee.selectedSizePrice : '', // Qiyməti göstər
                style: const TextStyle(fontSize: 15),
              )
            : null,
        leading: Image.asset(
          coffee.imagePath,
          width: 100,
          height: 300,
          fit: BoxFit.cover,
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
