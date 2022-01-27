import 'package:flutter/material.dart';

import '../helper/string_helper.dart';
import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class FirstNameFormField extends StatefulWidget {
  final bool readOnly;
  const FirstNameFormField({
    Key? key,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstNameFormFieldState();
  }
}

class FirstNameFormFieldState extends State<FirstNameFormField> {
  final firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: firstNameController,
      hint: StringHelper.firstNameHint,
      type: TextFormFieldType.firstName,
      readOnly: widget.readOnly,
    );
  }
}
