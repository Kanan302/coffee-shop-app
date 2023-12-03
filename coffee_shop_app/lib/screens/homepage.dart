import 'package:coffee_shop_app/components/nav_bar.dart';
import 'package:coffee_shop_app/reusable_widget/reusable_widget.dart';
import 'package:coffee_shop_app/screens/shop_page.dart';
import 'package:flutter/material.dart';

import 'card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ignore: unused_field
  int _selectindex = 0;
  void navigateBottomBar(int index){
    setState(() {
      _selectindex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(),
    CardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: NavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectindex],
    );
  }
}