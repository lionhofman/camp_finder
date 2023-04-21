import 'package:flutter/material.dart';

class CustomInputButton extends StatelessWidget {
  final Function()? onTap;
  final String labelButton;

  const CustomInputButton({
    super.key,
    required this.onTap,
    required this.labelButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 22),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            labelButton,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
