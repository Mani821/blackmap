import 'package:blackmap/UI/settings/theme_settings.dart';
import 'package:blackmap/const/app_theme.dart';
import 'package:blackmap/const/nav_manager.dart';
import 'package:blackmap/data/demo_model.dart';
import 'package:blackmap/widgets/buttons/cusom_icon_button.dart';
import 'package:blackmap/widgets/custom_textfield.dart';
import 'package:blackmap/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  final searchController = TextEditingController();
  int selectedIndex = 0;
  List<DemoModel> filteredDestinations = demoModels;

  void filterDestinations(String category) {
    setState(() {
      if (category == 'All') {
        filteredDestinations = demoModels;
      } else {
        filteredDestinations = demoModels.where((destination) {
          return destination.tags.any(
            (tag) =>
                tag.toLowerCase() == category.toLowerCase() ||
                (category == 'Ocean' && tag.toLowerCase() == 'ocean') ||
                (category == 'Mountains' && tag.toLowerCase() == 'mountains') ||
                (category == 'Hiking' && tag.toLowerCase() == 'hiking') ||
                (category == 'Beach' && tag.toLowerCase() == 'beach') ||
                (category == 'Forest' && tag.toLowerCase() == 'forest') ||
                (category == 'Camping' && tag.toLowerCase() == 'camping'),
          );
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(appThemeProvider.notifier).isDark;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: [
                  Hero(
                    tag: 'splash',
                    child: SizedBox(
                      height: 42,
                      width: 42,
                      child: SvgPicture.asset(
                        'assets/icons/map2.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn,
                        ),

                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Mani",
                          style: TextStyle(fontSize: 11, height: 0),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "to ",
                                style: TextStyle(fontSize: 11, height: 0),
                              ),
                              TextSpan(
                                text: "Black Map",
                                style: TextStyle(
                                  height: 0,
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animate(delay: 700.ms).fade(duration: 300.ms),
                  MyIconButton(
                    onTap: () {
                      NavManager.goTo(AppThemePage());
                    },
                    icon: "assets/icons/settings.svg",
                  ).animate(delay: 700.ms).fade(duration: 300.ms),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      spacing: 20,
                      children: [
                        Expanded(
                          child: MyTextField(
                            controller: searchController,
                            hint: 'Search here',
                            prefixIcon: 'assets/icons/search.svg',
                          ),
                        ),
                        MyIconButton(
                          onTap: () {},
                          icon: "assets/icons/filter.svg",
                        ),
                      ],
                    ).animate(delay: 1000.ms).fade(duration: 300.ms),
                  ),
                  SizedBox(height: 36),
                  Container(
                    color: Colors.transparent,
                    height: 40,
                    child: ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelected = index == selectedIndex;
                        final count = index + 1;
                        return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 16.0 : 8,
                                right: index == items.length - 1 ? 16.0 : 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  filterDestinations(items[index]);
                                },
                                child: AnimatedContainer(
                                  duration: 200.ms,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(
                                            context,
                                          ).chipTheme.backgroundColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      items[index],
                                      style: TextStyle(
                                        color: isSelected && isDark
                                            ? Colors.black
                                            : isSelected
                                            ? Colors.white
                                            : Theme.of(context).iconTheme.color,

                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .animate(delay: 1300.ms + (count * 100).ms)
                            .fade(duration: 200.ms)
                            .moveX(begin: 10, curve: Curves.easeOutBack);
                      },
                    ),
                  ),
                  SizedBox(height: 36),
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular Destinations',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                      .animate(delay: 1600.ms)
                      .fade(duration: 200.ms)
                      .moveY(begin: 10, duration: 300.ms),
                  ListView.builder(
                    itemCount: filteredDestinations.length,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    cacheExtent: 500,
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final destination = filteredDestinations[index];
                      return MyCard(isDark: isDark, destination: destination)
                          .animate(delay: (1800 + (index * 200)).ms)
                          .fade(duration: 300.ms)
                          .moveY(begin: 20, duration: 400.ms);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> items = [
    'All',
    'Ocean',
    'Mountains',
    'Hiking',
    'Beach',
    'Forest',
    'Camping',
  ];
}
