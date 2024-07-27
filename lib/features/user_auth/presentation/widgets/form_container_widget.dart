import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget(
      {super.key,
      this.controller,
      this.fieldKey,
      this.isPasswordField,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
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
      child: new TextFormField(
        style: TextStyle(color: Colors.blue),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.key,
        obscureText: widget.isPasswordField == true ? _obsecureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.black45),
            suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  _obsecureText = !_obsecureText;
                });
              },
              child: widget.isPasswordField == true
                  ? Icon(
                      _obsecureText ? Icons.visibility_off : Icons.visibility,
                      color: _obsecureText ? Colors.blue : Colors.grey,
                    )
                  : Text(""),
            )),
      ),
    );
  }
}
