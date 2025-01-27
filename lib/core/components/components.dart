import 'package:flutter/material.dart';

import '../helpers/local/cache_helper.dart';
import '../resources/constants.dart';


void singOut(context) {
  CacheHelper.clearData(key: 'ID').then((value) {
    CacheHelper.clearData(key: 'TokenId');
    if (value == true) {
      token = null;
      uid = null;
    }
  });

  if (token != null || uid != null) {
    token = null;
    uid = null;
  }
}

void navigateWithFade(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 700),
      // يمكنك ضبط الوقت هنا
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeIn;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    ),
  );
}

void navigateFish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

class FadeTransitionNavigator extends StatelessWidget {
  final Widget page;
  final Widget child;

  const FadeTransitionNavigator(
      {super.key, required this.page, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = 0.0;
              const end = 1.0;
              const curve = Curves.easeIn;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var opacityAnimation = animation.drive(tween);
              return FadeTransition(
                opacity: opacityAnimation,
                child: child,
              );
            },
            transitionDuration:
                const Duration(milliseconds: 700), // يمكنك ضبط الوقت هنا
          ),
        );
      },
      child: child,
    );
  }
}
