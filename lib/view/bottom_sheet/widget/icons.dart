import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  IconData icon;
  IconsWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 50,
    );
  }
}
