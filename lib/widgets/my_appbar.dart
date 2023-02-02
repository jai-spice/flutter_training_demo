import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const MyAppBar({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMyAppBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          const Align(
            //  Alignment widget
            alignment: Alignment.centerLeft,
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Center(
            // Alignment widget
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (trailing != null)
            Align(
              alignment: Alignment.centerRight,
              child: trailing,
            )
        ],
      ),
    );
  }
}
