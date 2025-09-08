import 'package:blackmap/UI/splash_started/started_page.dart';
import 'package:blackmap/const/app_colors.dart';
import 'package:blackmap/const/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> with TickerProviderStateMixin {
  late AnimationController _containerController;
  late AnimationController _progressController1;
  late AnimationController _progressController2;
  late AnimationController _scaleController1;
  late AnimationController _scaleController2;

  late Animation<double> _progressValue1;
  late Animation<double> _progressValue2;
  late Animation<double> _scaleAnimation1;
  late Animation<double> _scaleAnimation2;
  late Animation<double> _containerOpacity;

  bool _showProgress1 = false;
  bool _showProgress2 = false;

  // Base sizes
  static const double baseContainerSize = 200.0;
  static const double scaledContainerSize1 = 180.0;
  static const double scaledContainerSize2 = 140.0;
  static const double progressStrokeWidth = 32.0;
  static const double progressOffset1 = 48.0; // Distance from container edge
  static const double progressOffset2 = 125.0; // Distance from container edge

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _setupAnimations();
    _startAnimationSequence();
  }

  void _navigate() {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const GetStartedPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );
          return FadeTransition(opacity: curvedAnimation, child: child);
        },
      ),
      (route) => false,
    );
  }

  void _initializeControllers() {
    // Container aniamtion
    _containerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // First progress animation :)
    _progressController1 = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    // Second progress animation :)
    _progressController2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // First scale downanimation controller (200 -> 180)
    _scaleController1 = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Second scaledownsds animation controller (180 -> 140)
    _scaleController2 = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  void _setupAnimations() {
    // Container opacity animation
    _containerOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.easeInOut),
    );

    // First progress value animation (0 -> 1)
    _progressValue1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController1, curve: Curves.easeOutQuad),
    );

    // Second progress value animation (0 -> 1)
    _progressValue2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController2, curve: Curves.easeOutQuad),
    );

    // First scale animation (1.0 -> 0.9)
    _scaleAnimation1 =
        Tween<double>(
          begin: 1.0,
          end: scaledContainerSize1 / baseContainerSize, 
        ).animate(
          CurvedAnimation(parent: _scaleController1, curve: Curves.easeInOut),
        );

    // Second scale animation (1.0 -> ~0.777)
    _scaleAnimation2 =
        Tween<double>(
          begin: 1.0,
          end: scaledContainerSize2 / scaledContainerSize1, 
        ).animate(
          CurvedAnimation(parent: _scaleController2, curve: Curves.easeInOut),
        );
  }

  void _startAnimationSequence() async {
    // Start with container appearing
    await _containerController.forward();

    // Wait brother, then show first progress
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _showProgress1 = true;
    });

    // Start first progress animation
    _progressController1.forward();

    // Listen for progress and trigger scaling
    late VoidCallback listener1;
    listener1 = () {
      if (_progressController1.value >= 0.1 && _scaleController1.value == 0.0) {
        _scaleController1.forward();
        _progressController1.removeListener(listener1);
      }
    };
    _progressController1.addListener(listener1);

    // Wait for first progress to complete
    await _progressController1.forward();

    // Wait a bit :), then show second progress
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _showProgress2 = true;
    });

    // Start second progress animation
    _progressController2.forward();

    // Listen for second progress and trigger scaling
    late VoidCallback listener2;
    listener2 = () {
      if (_progressController2.value >= 0.1 && _scaleController2.value == 0.0) {
        _scaleController2.forward();
        _progressController2.removeListener(listener2);
      }
    };
    _progressController2.addListener(listener2);

    // Wait for second progress to complete
    await _progressController2.forward();

    // Navigate to next screen or complete splash
    await Future.delayed(const Duration(milliseconds: 1500));
    _navigate();
  }

  @override
  void dispose() {
    _containerController.dispose();
    _progressController1.dispose();
    _progressController2.dispose();
    _scaleController1.dispose();
    _scaleController2.dispose();
    super.dispose();
  }

  double get _currentScale {
    return _scaleAnimation1.value * _scaleAnimation2.value;
  }

  double get _currentContainerSize {
    return baseContainerSize * _currentScale;
  }

  double get _currentProgress1Size {
    return _currentContainerSize + progressOffset1;
  }

  double get _currentProgress2Size {
    return _currentContainerSize + progressOffset2;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider.notifier);
    final isDark = appTheme.isDark;
    return Scaffold(
    
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _containerController,
            _progressController1,
            _progressController2,
            _scaleController1,
            _scaleController2,
          ]),
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                      height: _currentContainerSize * 2.6,
                      width: _currentContainerSize * 2.6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: isDark ? Colors.black.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    )
                    .animate(target: _showProgress2 ? 1 : 0)
                    .fade(delay: 1.seconds),

              
                if (_showProgress2)
                  SizedBox(
                    height: _currentProgress2Size,
                    width: _currentProgress2Size,
                    child: CircularProgressIndicator(
                      strokeWidth: progressStrokeWidth,
                      color: secondaryColor,
                      strokeCap: StrokeCap.round,
                      backgroundColor: Colors.transparent,
                      value: _progressValue2.value,
                    ),
                  ),

               
                if (_showProgress1)
                  SizedBox(
                    height: _currentProgress1Size,
                    width: _currentProgress1Size,
                    child: CircularProgressIndicator(
                      strokeWidth: progressStrokeWidth,
                      color: primaryColor,
                      strokeCap: StrokeCap.round,
                      backgroundColor: Colors.transparent,
                      value: _progressValue1.value,
                    ),
                  ),

               
                AnimatedBuilder(
                  animation: _containerOpacity,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _containerOpacity.value,
                      child: Container(
                        padding: EdgeInsets.all(20),

                        height: _currentContainerSize,
                        width: _currentContainerSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 46, 109, 198),
                        ),
                        child: Hero(
                          tag: 'splash',
                          child: SvgPicture.asset(
                            'assets/icons/map.svg',
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            height: _currentContainerSize * 0.4,
                            width: _currentContainerSize * 0.4,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
