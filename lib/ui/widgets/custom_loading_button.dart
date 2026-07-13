import 'package:flutter/material.dart';
import 'package:gps_test/ui/utils/utils.dart';

class CustomLoadingButton extends StatefulWidget {
  const CustomLoadingButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loadingDuration = const Duration(seconds: 1),
  });
  final String title;
  final VoidCallback onPressed;
  final Duration loadingDuration;

  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.9,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          overlayColor: Colors.white,
          backgroundColor: AppColors.primary,
        ),
        onPressed: () async {
          setState(() => isLoading = true);
          await Future.delayed(
            widget.loadingDuration,
          ).whenComplete(() => setState(() => isLoading = false));

          widget.onPressed();
        },
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(widget.title, style: AppText.textLight),
        ),
      ),
    );
  }
}
