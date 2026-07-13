import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gps_test/core/providers/providers.dart';
// import 'package:gps_test/ui/modules/car/car_screen.dart';
import 'package:gps_test/ui/modules/login/login_screen.dart';
import 'package:gps_test/ui/utils/app_theme.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Kilometraje Wialon',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home: CarScreen(),
      themeMode: theme,
      theme: AppTheme.lighTheme(),
      darkTheme: AppTheme.darkTheme(),
    );
  }
}
