import 'package:flutter/material.dart';

import 'package:pkart/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({super.key, this.width, this.height, required this.icon, this.color, this.backgroundColor, this.onPressed, this.size = 16.0});

  final double? width,height,size;
  final IconData icon;
  final Color? color;
  final Color?  backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor! : THelperFunctions.isDarkMode(context) ? Colors.black.withOpacity(0.9) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon,color: color,size: size,),),
    );
  }
}
