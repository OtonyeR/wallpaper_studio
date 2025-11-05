import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class GradientText extends StatelessWidget {
  final styles = AppTheme();

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  GradientText(
      this.text, {
        super.key,
        required this.gradient,
        this.style,
      });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn, // 🔹 ensures gradient shows only where text is
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: (style ?? Theme.of(context).textTheme.displayLarge)
      ),
    );
  }
}
