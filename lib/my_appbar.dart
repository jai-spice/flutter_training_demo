import 'package:demo/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMyAppBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: const [
          Align(
            //  Alignment widget
            alignment: Alignment.centerLeft,
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Center(
            // Alignment widget
            child: Text(
              'My Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
