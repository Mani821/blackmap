import 'package:blackmap/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_colors.dart';

final appThemeProvider = StateNotifierProvider<AppThemes, ThemeMode>((ref) {
  final prefs = ref.watch(sharedPreferenceProvider);
  return AppThemes(prefs);
});

class AppThemes extends StateNotifier<ThemeMode> {
  final SharedPreferences _sharedPreferences;
  String themeMode = "dark";

  AppThemes(this._sharedPreferences) : super(ThemeMode.system) {
    themeMode = _sharedPreferences.getString('theme') ?? 'dark';
    setTheme(themeMode);
  }

  void toggleTheme() {
    final newTheme = themeMode == 'dark' ? 'light' : 'dark';
    setTheme(newTheme);
  }

  void setTheme(String theme) {
    themeMode = theme;
    _sharedPreferences.setString('theme', theme);
    switch (theme) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  bool get isDark => themeMode == "dark";

  static final lightTheme = ThemeData(
    primaryColor: secondaryColor,
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(Colors.white),
      backgroundColor: const Color.fromARGB(255, 233, 229, 229),
    ),
    hintColor: Colors.grey,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: 'Lexend',
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: 'Lexend',
      ),
      displayLarge: TextStyle(
        color: textColor,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        fontFamily: 'Lexend',
      ),
      displayMedium: TextStyle(
        color: textColor,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        fontFamily: 'Lexend',
      ),
      displaySmall: TextStyle(
        color: textColor,
        fontSize: 48,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      headlineMedium: TextStyle(
        color: textColor,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      headlineSmall: TextStyle(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      titleSmall: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      bodySmall: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
    ),
    cardColor: lightCardColor,
    datePickerTheme: DatePickerThemeData(
      backgroundColor: lightCardColor,
      dayShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      todayBackgroundColor: WidgetStatePropertyAll(primaryColor),
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),

      todayBorder: BorderSide.none,
      headerBackgroundColor: primaryColor,
      headerForegroundColor: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dividerColor: primaryColor,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),

    iconTheme: IconThemeData(color: Colors.black),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(secondaryColor),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lexend',
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    ),
    scaffoldBackgroundColor: lightBgColor,
    listTileTheme: ListTileThemeData(
      iconColor: Colors.black,
      textColor: textColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      sizeConstraints: BoxConstraints(maxHeight: 40),
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),

    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: lightBgColor,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightBgColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: lightBgColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: GoogleFonts.lexend(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      actionsIconTheme: const IconThemeData(color: Colors.black),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(darkCardColor),
      backgroundColor: darkCardColor,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    primaryColor: primaryColor,
    hintColor: Colors.grey,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Lexend',
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: 'Lexend',
      ),
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        fontFamily: 'Lexend',
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        fontFamily: 'Lexend',
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lexend',
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
    ),
    cardColor: darkCardColor,
    datePickerTheme: DatePickerThemeData(
      dividerColor: secondaryColor,
      backgroundColor: darkCardColor,
      headerBackgroundColor: secondaryColor,
      headerForegroundColor: Colors.white,
      dayShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      todayBackgroundColor: WidgetStatePropertyAll(secondaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dayForegroundColor: WidgetStatePropertyAll(Colors.white),
      todayBorder: BorderSide.none,
      dayOverlayColor: WidgetStatePropertyAll(hintColor),
      rangeSelectionOverlayColor: WidgetStatePropertyAll(hintColor),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: hintColor),
        helperStyle: TextStyle(color: hintColor),
      ),
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),
      dayStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lexend',
      ),
      rangePickerHeaderForegroundColor: Colors.white,
      rangePickerSurfaceTintColor: hintColor,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(primaryColor),

        foregroundColor: const WidgetStatePropertyAll(Colors.black),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lexend',
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    ),
    scaffoldBackgroundColor: darkBgColor,
    listTileTheme: ListTileThemeData(
      tileColor: darkCardColor,
      textColor: Colors.white,
      iconColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      sizeConstraints: BoxConstraints(maxHeight: 40),
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),

    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: darkBgColor,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkBgColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: darkBgColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Lexend',
      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
