import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';
import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  bool? isIcon;
  IconData? icon;


  AppButtons({
    super.key,
    this.icon,
    this.isIcon=false,
    this.text="Hi",
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon==false?
        Center(child: AppText(text: text!,color:color,))
        :
        Center(child: Icon(icon,color: color,)),
    );
  }
}