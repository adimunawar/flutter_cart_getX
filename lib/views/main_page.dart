import 'package:flutter/material.dart';
import 'package:get_x_latihan/views/shoping_page.dart';
import 'package:get_x_latihan/views/widgets/cust_navbar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: PageView(
            children: [
              ShoppingPage(),
            ],
          )),
          Align(alignment: Alignment.bottomCenter, child: CustomNavbar())
        ],
      ),
    );
  }
}
