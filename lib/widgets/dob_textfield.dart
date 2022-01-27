import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/string_helper.dart';
import 'styled_text_form_field.dart';
import 'text_form_field_type.dart';

class DobFormField extends StatefulWidget {
  const DobFormField({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DobFormFieldState();
  }
}

class DobFormFieldState extends State<DobFormField> {
  final dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledTextFormField(
      controller: dobController,
      hint: StringHelper.selectDobHint,
      type: TextFormFieldType.dob,
      onTap: () {
        selectDob();
      },
    );
  }

  void selectDob() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(1800),
      lastDate: DateTime(DateTime.now().year - 18),
    );
    if (pickedDate != null) {
      int year = pickedDate.year;
      int month = pickedDate.month;
      int date = pickedDate.day;
      var selectedDate = '$date/$month/$year';
      setState(() {
        dobController.text = selectedDate;
      });
    }
  }
}
