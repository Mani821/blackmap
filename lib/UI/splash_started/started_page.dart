import 'package:blackmap/UI/home/homepage.dart';
import 'package:blackmap/widgets/buttons/sliding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withValues(alpha: 0), Colors.black],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(flex: 3),
                  Hero(
                    tag: 'splash',
                    child: SizedBox(
                      height: 190,
                      width: 190,
                      child: SvgPicture.asset(
                        'assets/icons/map.svg',
                        height: 190,
                        width: 190,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 14,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                              'Embark on your great next adventure',
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                height: 1.2,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            .animate(delay: 600.ms)
                            .slideY(begin: .3)
                            .fade(duration: 700.ms),

                        Text(
                              'Discover hidden gems and create unforgettable memories. Create your own travel plan and share it with your friends.',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                            .animate(delay: 1200.ms)
                            .slideY(begin: .3)
                            .fade(duration: 700.ms),
                      ],
                    ),
                  ),
                  Spacer(),
                  SafeArea(
                    top: false,
                    child:
                        SlidingButton(
                              onSlideComplete: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(
                                      milliseconds: 1000,
                                    ),
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => const Homepage(),
                                    transitionsBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          final curvedAnimation =
                                              CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeOutCubic,
                                              );
                                          return FadeTransition(
                                            opacity: curvedAnimation,
                                            child: child,
                                          );
                                        },
                                  ),
                                  (route) => false,
                                );
                              },
                            )
                            .animate(delay: 1800.ms)
                            .slideY(begin: .5)
                            .fade(duration: 700.ms),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
