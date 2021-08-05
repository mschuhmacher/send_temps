import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget cardChild;
  final VoidCallback tapCard;

  CustomCard({required this.cardChild, required this.tapCard});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCard,
      child: Container(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Center(
          child: cardChild,
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
