import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      // ignore: avoid_print, prefer_function_declarations_over_variables
      final onPressed = () => print('click');
      return Container(
          height: 100,
          width: 1200,
          color: const Color.fromARGB(255, 246, 246, 233),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const FlutterLogo(),
              const Spacer(),
              for (var item in listNavigationItem)
                NavigationBarItem(onPressed: onPressed, text: item.text)
            ],
          ));
    });
  }
}

class NavigationItem {
  final String text;
  NavigationItem(this.text);
}

final listNavigationItem = [
  NavigationItem('Ranking'),
  NavigationItem('Students'),
  NavigationItem('Settings'),
];

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
          mouseCursor: MaterialStateMouseCursor.clickable,
          hoverColor: Color.fromARGB(255, 246, 246, 233),
          splashColor: Color.fromRGBO(246, 215, 245, 1),
          highlightColor: Color.fromARGB(255, 246, 246, 233),
          onTap: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          )),
    );
  }
}
