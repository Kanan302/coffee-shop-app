import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class NavBar extends StatefulWidget {
  void Function(int)? onTabChange;
  NavBar({
    super.key, 
    required this.onTabChange
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: GNav(
        onTabChange: (value) => widget.onTabChange!(value),
        color: Colors.grey[700],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: "Cart",
          )
        ],
      ),
    );
  }
}
