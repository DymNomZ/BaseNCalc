import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  //Made entirely by me: DymNomZ

  final IconData icon;

  const CustomIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Icon(
        icon, 
        color: Colors.white, 
        size: 30),
    );
  }
}