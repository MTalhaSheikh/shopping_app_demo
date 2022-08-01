import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final Color color;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.margin = const EdgeInsets.all(16),
    this.color = Colors.teal,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Opacity(
        opacity: (!enabled) ? 0.5 : 1.0,
        child: Material(
          borderRadius: BorderRadius.circular(5.0),
          child: InkWell(
            onTap: enabled ? onPressed : null,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}