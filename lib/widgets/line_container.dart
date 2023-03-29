import 'package:flutter/material.dart';
class LineContainer extends StatelessWidget {
  
  const LineContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(color: color),        
        color: color,
      ),
    );
  }
}