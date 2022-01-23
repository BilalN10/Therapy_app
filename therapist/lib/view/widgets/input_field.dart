import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class InputField extends StatefulWidget {
  final String hint, label;
  final TextEditingController controller;
  final bool isPassField, readOnly;
  final TextInputType textInputType;
  final Function validator;
  final int maxLines;

  const InputField({
    @required this.validator,
    @required this.hint,
    @required this.controller,
    this.readOnly = false,
    this.label,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.isPassField = false,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _showPass = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.isPassField ? !_showPass : false,
      keyboardType: widget.textInputType,
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
      decoration: InputDecoration(
        labelText: widget.label ?? null,
        labelStyle: Theme.of(context).textTheme.subtitle2.copyWith(
              color: Colors.grey,
            ),
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
              color: Colors.grey,
            ),
        suffixIcon: widget.isPassField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _showPass = !_showPass;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: _showPass ? kPrimaryColor : Colors.grey,
                ),
              )
            : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
