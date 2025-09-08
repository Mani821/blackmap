import 'package:flutter/material.dart';

class SlidingButton extends StatefulWidget {
  final VoidCallback? onSlideComplete;

  const SlidingButton({super.key, this.onSlideComplete});

  @override
  State<SlidingButton> createState() => _SlidingButtonState();
}

class _SlidingButtonState extends State<SlidingButton>
    with SingleTickerProviderStateMixin {
  double glassPosition = 1.4;
  double maxSlideDistance = 0.0;
  bool isCompleted = false;
  bool hasTriggeredCallback = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            maxSlideDistance = constraints.maxWidth - 60;

            return Stack(
              children: [
                Container(
                  height: 56,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Swipe to continue',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: glassPosition,
                  top: 2.5,

                  child: GestureDetector(
                    onPanStart: (details) {},
                    onPanUpdate: (details) {
                      setState(() {
                        glassPosition += details.delta.dx;
                        glassPosition = glassPosition.clamp(
                          0.0,
                          maxSlideDistance,
                        );
                        bool wasCompleted = isCompleted;
                        isCompleted = glassPosition >= maxSlideDistance;

                        if (isCompleted &&
                            !wasCompleted &&
                            !hasTriggeredCallback) {
                          hasTriggeredCallback = true;
                          widget.onSlideComplete?.call();
                        }

                        if (glassPosition < maxSlideDistance * 0.9) {
                          isCompleted = false;
                          hasTriggeredCallback = false;
                        }
                      });
                    },
                    onPanEnd: (details) {},
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),

                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                        child: Icon(
                          isCompleted ? Icons.check : Icons.chevron_right,
                          key: ValueKey(isCompleted),
                          color: Colors.white,
                          size: !isCompleted ? 32 : 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
