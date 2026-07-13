import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gps_test/ui/utils/utils.dart';

enum ToastTypes { neutral, notify, succes, warning, error }

final Map<ToastTypes, Color> _colors = {
  ToastTypes.neutral: Colors.grey,
  ToastTypes.notify: AppColors.primary,
  ToastTypes.succes: Colors.lightGreen,
  ToastTypes.warning: Colors.amber,
  ToastTypes.error: Colors.red,
};

final Map<ToastTypes, IconData> _icons = {
  ToastTypes.neutral: Icons.info_outline,
  ToastTypes.notify: Icons.notification_important_rounded,
  ToastTypes.succes: Icons.done_all_rounded,
  ToastTypes.warning: Icons.warning_amber_rounded,
  ToastTypes.error: Icons.block_rounded,
};

class AppToast {
  AppToast._();

  static OverlayEntry showMessage(
    BuildContext context, {
    required String title,
    String subtitle = '',
    ToastTypes type = ToastTypes.notify,
    int durationSeconds = 3,
    Alignment position = Alignment.topCenter,
  }) {
    final overlayEntry = OverlayEntry(
      builder: (context) => SafeArea(
        child: Align(
          alignment: position,
          child: SlideInDown(
            duration: const Duration(milliseconds: 400),
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: _colors[type]?.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(_icons[type], color: _colors[type]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppText.subtitle),
                          Text(subtitle, style: AppText.text),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: durationSeconds), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });

    return overlayEntry;
  }
}
