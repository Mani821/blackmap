import 'package:blackmap/const/app_colors.dart';
import 'package:blackmap/const/app_theme.dart';
import 'package:blackmap/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemePage extends ConsumerStatefulWidget {
  const AppThemePage({super.key});

  @override
  ConsumerState<AppThemePage> createState() => _AppThemePageState();
}

class _AppThemePageState extends ConsumerState<AppThemePage> {
  int currentPosition = 0;

  @override
  void initState() {
      currentPosition = prefs.getString('theme')! == "light"
        ? 1
        : prefs.getString('theme')! == 'dark'
            ? 2
            : 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Theme'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPosition = 1;
                    appTheme.setTheme("light");
                  });
                },
                child: Column(
                  children: [
                    AnimatedContainer(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: 190,
                      width: 100,
                      duration: 150.ms,
                      decoration: BoxDecoration(
                        color: darkBgColor,
                        border: Border.all(
                          color: Theme.of(context).hintColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 4,
                                      bottom: 6,
                                    ),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 6,
                                      bottom: 6,
                                    ),
                                    height: 10,
                                    width:
                                        index == 0 || index == 2 || index == 5
                                        ? 20
                                        : 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 6, bottom: 6),
                                height: 10,
                                width: index == 0 || index == 2 || index == 5
                                    ? 30
                                    : 20,
                                decoration: BoxDecoration(
                                  color: index == 2 || index == 3
                                      ? secondaryColor
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 14),
                    AnimatedContainer(
                      duration: 200.ms,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: currentPosition == 1 ? 6.4 : 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text('Light'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentPosition = 2;
                    appTheme.setTheme("dark");
                  });
                },
                child: Column(
                  children: [
                    AnimatedContainer(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: 190,
                      width: 100,
                      duration: 150.ms,
                      decoration: BoxDecoration(
                        color: darkBgColor,
                        border: Border.all(
                          color: Theme.of(context).hintColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 4,
                                      bottom: 6,
                                    ),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 6,
                                      bottom: 6,
                                    ),
                                    height: 10,
                                    width:
                                        index == 0 || index == 2 || index == 5
                                        ? 20
                                        : 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 6, bottom: 6),
                                height: 10,
                                width: index == 0 || index == 2 || index == 5
                                    ? 30
                                    : 20,
                                decoration: BoxDecoration(
                                  color: index == 2 || index == 3
                                      ? primaryColor
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 14),
                    AnimatedContainer(
                      duration: 200.ms,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: currentPosition == 2 ? 6.4 : 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text('Dark'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 18),
              title: Text(
                'System Theme',
                style: GoogleFonts.lexend(fontSize: 16),
              ),
              subtitle: Text(
                'Theme will change depending on phone settings',
                style: GoogleFonts.lexend(
                  fontSize: 10,
                  color: Theme.of(context).hintColor,
                ),
              ),
              trailing: Theme(
                data: ThemeData(useMaterial3: false),
                child: Switch.adaptive(
                  value: currentPosition == 3,
                  onChanged: (value) async {
                    setState(() {
                      if (currentPosition == 3) {
                        currentPosition = 1;
                        appTheme.setTheme("light");
                      } else {
                        currentPosition = 3;
                        appTheme.setTheme("system");
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

         
        ],
      ),
    );
  }
}
