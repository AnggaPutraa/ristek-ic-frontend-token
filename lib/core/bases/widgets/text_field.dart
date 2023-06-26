import 'package:flutter/material.dart';

import '../../theme/base_colors.dart';
import '../decorators/input_decorator.dart';
import '../enums/text_field.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    this.type = TextFieldType.regular,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController controller;
  final TextFieldType type;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final bool enabled;

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: BaseColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
          cursorColor: BaseColors.primary,
          controller: widget.controller,
          keyboardType: widget.inputType,
          onChanged: widget.onChanged,
          style: const TextStyle(
            color: BaseColors.primary,
          ),
          decoration: _inputDecoration.copyWith(
            filled: !widget.enabled,
            fillColor: BaseColors.primary,
          ),
          enabled: widget.enabled,
          obscureText: widget.type == TextFieldType.password && _isObscured,
        )
      ],
    );
  }

  InputDecoration get _inputDecoration {
    switch (widget.type) {
      case TextFieldType.regular:
        return TextInputDecorator.form(widget.hint);
      case TextFieldType.password:
        return TextInputDecorator.form(
          widget.hint,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
            icon: Icon(
              _isObscured ? Icons.visibility : Icons.visibility_off,
              color: BaseColors.primary,
            ),
          ),
        );
    }
  }
}
