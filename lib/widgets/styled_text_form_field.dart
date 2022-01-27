import 'package:esync_demo/widgets/text_form_field_type.dart';
import 'package:flutter/material.dart';

class StyledTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextFormFieldType type;
  final String hint;
  final Function? onTap;
  final bool? readOnly;
  final bool? enabled;

  const StyledTextFormField({
    Key? key,
    this.hint = '',
    required this.controller,
    this.type = TextFormFieldType.unknown,
    this.onTap,
    this.readOnly,
    this.enabled,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StyledTextFormFieldState();
  }
}

class StyledTextFormFieldState extends State<StyledTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          widget.enabled == false ? const TextStyle(color: Colors.grey) : null,
      controller: widget.controller,
      enabled: widget.enabled,
      decoration: InputDecoration(
        hintText: widget.hint,
      ),
      keyboardType: getInputType(),
      obscureText: widget.type == TextFormFieldType.password,
      validator: validator,
      readOnly: isReadOnly(),
      onTap: widget.onTap == null
          ? null
          : () {
              widget.onTap!();
            },
    );
  }

  TextInputType getInputType() {
    switch (widget.type) {
      case TextFormFieldType.email:
        return TextInputType.emailAddress;
      case TextFormFieldType.phoneNumber:
        return TextInputType.phone;
      case TextFormFieldType.password:
        return TextInputType.visiblePassword;
      case TextFormFieldType.firstName:
        return TextInputType.name;
      case TextFormFieldType.lastName:
        return TextInputType.name;
      case TextFormFieldType.gender:
        return TextInputType.name;
      case TextFormFieldType.dob:
        return TextInputType.name;
      default:
        return TextInputType.name;
    }
  }

  String? validator(String? value) {
    if (value != null) {
      switch (widget.type) {
        case TextFormFieldType.email:
          RegExp pattern = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (value.isEmpty) {
            return 'Enter your email address to continue';
          }
          if (!pattern.hasMatch(value)) {
            return 'Enter valid email address to continue';
          }
          break;
        case TextFormFieldType.phoneNumber:
          if (value.isEmpty) {
            return 'Enter your phone number to continue';
          }
          break;
        case TextFormFieldType.password:
          if (value.isEmpty) {
            return 'Enter password to continue';
          }
          break;
        case TextFormFieldType.firstName:
          if (value.isEmpty) {
            return 'Enter your first name to continue';
          }
          break;
        case TextFormFieldType.lastName:
          if (value.isEmpty) {
            return 'Enter your last name to continue';
          }
          break;
        case TextFormFieldType.gender:
          if (value.isEmpty) {
            return 'Select Gender to continue';
          }
          break;
        case TextFormFieldType.dob:
          if (value.isEmpty) {
            return 'Select Date of Birth to continue';
          }
          break;
        case TextFormFieldType.unknown:
          break;
      }
    }
    return null;
  }

  bool isReadOnly() {
    return widget.type == TextFormFieldType.dob ||
        widget.type == TextFormFieldType.gender;
  }
}
