import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? placeholder;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFiledSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget(
      {super.key,
      this.controller,
      this.fieldKey,
      this.isPasswordField,
      this.placeholder,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFiledSubmitted,
      this.inputType});

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    return Container(
      width: widht * 0.4,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.35),
          borderRadius: BorderRadius.circular(20)),
      child: new CupertinoTextField(
        style: TextStyle(color: Colors.blue),
        placeholder: widget.placeholder,
        placeholderStyle: TextStyle(color: Colors.white),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.key,
        obscureText: widget.isPasswordField == true ? _obsecureText : false,
        decoration: BoxDecoration(),
      ),
    );
  }
}
