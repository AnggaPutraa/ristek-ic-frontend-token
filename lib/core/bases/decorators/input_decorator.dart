import 'package:flutter/material.dart';

import '../../theme/base_colors.dart';

class TextInputDecorator {
  TextInputDecorator() {
    _inputDecoration = const InputDecoration();
  }

  late InputDecoration _inputDecoration;

  InputDecoration defaultDecoration() {
    return _inputDecoration.copyWith();
  }

  static InputDecoration form(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: BaseColors.secondary,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: BaseColors.primary,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
