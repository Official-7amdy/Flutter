import 'package:flutter/material.dart';

void push(BuildContext context, Widget newScreen) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => newScreen),
  );
}

void pushWithReplacement(BuildContext context, Widget newScreen) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => newScreen),
  );
}

void pop(BuildContext context) {
  Navigator.of(context).pop();
}

void pushAndRemoveUntil(BuildContext context, Widget newScreen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => newScreen),
    (Route<dynamic> route) => false,
  );
}

void pushNamed(BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(routeName);
}

void pushReplacementNamed(BuildContext context, String routeName) {
  Navigator.of(context).pushReplacementNamed(routeName);
}

Future<void> pushWithResult(BuildContext context, Widget newScreen) async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => newScreen),
  );
  // Do something with the result
}

void pushWithSlideTransition(BuildContext context, Widget newScreen) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
