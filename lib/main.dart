import 'package:blackmap/UI/splash_started/splash.dart';
import 'package:blackmap/const/app_theme.dart';
import 'package:blackmap/const/nav_manager.dart';
import 'package:blackmap/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferenceProvider.overrideWithValue(prefs)],

      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.translucent,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        navigatorKey: navigatorKey,
        darkTheme: AppThemes.darkTheme,
        theme: AppThemes.lightTheme,
        themeAnimationStyle: AnimationStyle(curve: Curves.easeInOut),
        themeMode: theme,
      ),
    );
  }
}
