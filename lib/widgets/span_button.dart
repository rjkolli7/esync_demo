import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helper/test_styles.dart';

class SpanButton extends StatelessWidget {
  final String span1Text;
  final String clickableSpan;
  final Function onPressed;

  const SpanButton(
      {Key? key,
      required this.span1Text,
      required this.clickableSpan,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: span1Text,
            style: TextStyles.regularTextStyle.copyWith(
              color: Theme.of(context).textTheme.labelMedium?.color,
            ),
          ),
          TextSpan(
            text: clickableSpan,
            style: TextStyles.mediumUnderLineTextStyle.copyWith(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onPressed();
              },
          ),
        ],
      ),
    );
  }
}
