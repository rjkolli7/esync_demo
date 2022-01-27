import 'package:flutter/material.dart';

class StyledMaterialButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const StyledMaterialButton(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          onPressed();
        },
        color: Theme.of(context).buttonTheme.colorScheme?.primary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
        child: Text(title));
  }
}
