import 'package:flutter/material.dart';
class CircleContainer extends StatelessWidget {
  
  const CircleContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        
        color: color,
      ),
    );
  }
}