import 'package:flutter/material.dart';

import '../../theme/base_colors.dart';

class Button extends StatelessWidget {
  final String text;
  final Function? onTap;
  final bool? isLoading;
  final bool? isDisabled;

  const Button({
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isLoading! && !isDisabled!) {
            onTap!();
          }
        },
        child: Opacity(
          opacity: isDisabled! ? 0.5 : 1,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: BaseColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: BaseColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
