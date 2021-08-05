import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{

  final IconData childIcon;

  CustomIconButton({required this.childIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('CustomIconButton tapped'),
      child: Container(
        child: Icon(
          childIcon,
          size: 40.0,
        ),
      ),
    );
  }
}