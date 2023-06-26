import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bases/constants/assets.dart';
import '../../../../core/bases/widgets/button.dart';
import '../../../../core/bases/widgets/scaffold.dart';
import '../../../../core/theme/base_colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SvgPicture.asset(
              Assets.firebase,
              width: 220,
              height: 220,
              colorFilter: const ColorFilter.mode(
                BaseColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Button(
                    text: 'Sign In',
                    onTap: () {
                      context.go('/auth/signin');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Button(
                    text: 'Sign Up',
                    onTap: () {
                      context.go('/auth/signup');
                    },
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
