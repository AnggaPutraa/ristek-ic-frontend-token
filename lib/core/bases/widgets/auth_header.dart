import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/base_colors.dart';
import '../constants/assets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SvgPicture.asset(
        Assets.firebase,
        width: 160,
        height: 160,
        colorFilter: const ColorFilter.mode(
          BaseColors.primary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
