import 'package:flutter/material.dart';

import '../helper/string_helper.dart';
import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class LastNameFormField extends StatefulWidget {
  const LastNameFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LastNameFormFieldState();
  }
}

class LastNameFormFieldState extends State<LastNameFormField> {
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: lastNameController,
      hint: StringHelper.lastNameHint,
      type: TextFormFieldType.lastName,
    );
  }
}
