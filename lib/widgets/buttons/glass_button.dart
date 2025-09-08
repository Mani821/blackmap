import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool isTopRadius;
  final double padding;

  const GlassButton({
    super.key,
    required this.child,
    this.onTap,
    this.isTopRadius = false,
    this.padding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.black38,
            padding: EdgeInsets.all(8),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(iconTheme: IconThemeData(color: Colors.white)),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  height: 16,
                  width: 16,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
