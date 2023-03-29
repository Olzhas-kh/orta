import 'package:flutter/material.dart';
import 'package:orta/utils/app_styles.dart';
class CircleContainer extends StatelessWidget {
  
  const CircleContainer({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Styles.greyColor),
        color: color,
      ),
    );
  }
}