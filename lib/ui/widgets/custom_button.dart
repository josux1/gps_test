import 'package:flutter/material.dart';
import 'package:gps_test/ui/utils/utils.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        overlayColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      onPressed: onPressed,
      child: Text(title, style: AppText.textLight),
    );
  }
}
