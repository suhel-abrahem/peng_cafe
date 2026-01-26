import 'package:flutter/material.dart';

class CustomSettingsPages extends StatelessWidget {
  final String title;
  final List<Widget> bodyChild;
  final MainAxisAlignment? childMainAxisAlignment;
  const CustomSettingsPages(
      {super.key,
      required this.title,
      required this.bodyChild,
      this.childMainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          )),
        ),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment:
                childMainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
            children: bodyChild,
          ),
        )
      ],
    );
  }
}
