import 'package:flutter/material.dart';

import '../helper/string_helper.dart';
import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PhoneTextFormFieldState();
  }
}

class PhoneTextFormFieldState extends State<PhoneTextFormField> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: phoneController,
      hint: StringHelper.phoneNumberHint,
      type: TextFormFieldType.phoneNumber,
    );
  }
}
