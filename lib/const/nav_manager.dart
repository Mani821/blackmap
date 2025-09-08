import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();


/// Easy Navigation class to navigate through pages easily with short code + animation
class NavManager {
  const NavManager._();

  static BuildContext get context => navigatorKey.currentState!.context;

  static Future<T?> goTo<T extends Object>(Widget page) {
    if (Platform.isIOS) {
      return Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => page,
        ),
      );
    } else {
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  static Future<T?> goWithAnimation<T extends Object>(Widget page){
    return Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );
          return FadeTransition(
            opacity: curvedAnimation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.5),
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            ),
          );
        },
      ),
          (route) => false,
    );
  }

  // static Future<T?> goTo<T extends Object>(Widget page) {
  //   return Navigator.push(
  //       context, PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => page,
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         return SlideTransition(
  //           position: Tween<Offset>(
  //             begin: const Offset(1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //           child: FadeTransition(
  //             opacity: animation,
  //             child: child,
  //           ),
  //         );
  //       }
  //   ),);
  // }

  static Future<T?> replace<T extends Object>(Widget page) {
    return Navigator.pushReplacement(
        context,
        Platform.isAndroid
            ? MaterialPageRoute(builder: ((context) => page))
            : CupertinoPageRoute(builder: ((context) => page)));
  }

  static Future<T?> gotoAndRemoveAllPrevious<T extends Object>(Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(
        Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => page) :
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static Future<T?> gotoAndRemoveUntil<T extends Object>(
      Widget page, RoutePredicate predicate) {
    return Navigator.of(context).pushAndRemoveUntil(
        Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => page) :
        MaterialPageRoute(builder: (context) => page), predicate);
  }
}
