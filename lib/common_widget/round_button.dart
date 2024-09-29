import 'package:flutter/material.dart';
import '../common/color_extension.dart';

enum RoundButtonType { primary, primaryText }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final RoundButtonType type;
  final Color? customColor; // Add this line for custom color

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.type = RoundButtonType.primary,
    this.customColor, // Add customColor to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: type == RoundButtonType.primary ? TColor.white : TColor.primary,
      color: customColor ?? (type == RoundButtonType.primary ? TColor.primary : TColor.white), // Use customColor if provided
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Text(
        title,
        style: TextStyle(
          color: type == RoundButtonType.primary ? TColor.black : TColor.primary,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
