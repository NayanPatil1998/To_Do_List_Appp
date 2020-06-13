import 'package:flutter/material.dart';
import 'package:todoapplist/Widgets/textFiledContainer.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final TextInputType textType;
  final FormFieldValidator<String> validator;

  final bool secureType;
  const RoundedTextField({
    Key key,
    this.hintText,
    this.textType,
    this.secureType = false,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: secureType,
        onChanged: onSaved,
        validator: validator,
        keyboardType: textType,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
