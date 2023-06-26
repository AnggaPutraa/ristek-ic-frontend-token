import 'package:flutter/material.dart';

import '../../theme/base_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  const CustomScaffold({
    required this.body,
    this.backgroundColor,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 28,
          ),
          child: body,
        ),
      ),
      backgroundColor: backgroundColor ?? BaseColors.black,
      resizeToAvoidBottomInset: true,
    );
  }
}
