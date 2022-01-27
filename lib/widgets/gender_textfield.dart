import 'package:esync_demo/helper/test_styles.dart';
import 'package:flutter/material.dart';

import '../helper/string_helper.dart';
import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class GenderFormField extends StatefulWidget {
  const GenderFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GenderFormFieldState();
  }
}

class GenderFormFieldState extends State<GenderFormField> {
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: genderController,
      hint: StringHelper.selectGenderHint,
      type: TextFormFieldType.gender,
      onTap: () {
        selectGender();
      },
    );
  }

  void selectGender() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            StringHelper.selectGenderHint,
            style: TextStyles.titleTextStyle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      setState(() {
                        genderController.text = StringHelper.male;
                      });
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text(
                    StringHelper.male,
                    style: TextStyles.regularTextStyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      genderController.text = StringHelper.female;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    StringHelper.female,
                    style: TextStyles.regularTextStyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      genderController.text = StringHelper.other;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    StringHelper.other,
                    style: TextStyles.regularTextStyle,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                StringHelper.cancel,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
