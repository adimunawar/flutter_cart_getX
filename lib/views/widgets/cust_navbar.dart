import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 19,
                width: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/home.png'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 18,
                width: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/BG.png'),
                        fit: BoxFit.fitHeight)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 19,
                width: 19,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cart.png'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Icon_user_solid.png'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
