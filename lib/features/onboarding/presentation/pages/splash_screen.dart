import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bases/constants/assets.dart';
import '../../../../core/bases/widgets/scaffold.dart';
import '../../../../core/theme/base_colors.dart';
import '../../../../services/di.dart';
import '../cubit/app_initialization_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppInitializationCubit _cubit;

  @override
  void initState() {
    _cubit = get<AppInitializationCubit>();
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocListener<AppInitializationCubit, AppInitializationState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.go('/main');
          } else {
            context.go('/onboarding');
          }
        },
        child: Center(
          child: SvgPicture.asset(
            Assets.firebase,
            width: 200,
            height: 200,
            colorFilter: const ColorFilter.mode(
              BaseColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
