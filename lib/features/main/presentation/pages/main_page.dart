import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bases/constants/assets.dart';
import '../../../../core/bases/widgets/button.dart';
import '../../../../core/bases/widgets/scaffold.dart';
import '../../../../core/theme/base_colors.dart';
import '../../../../services/di.dart';
import '../cubit/main_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final MainCubit _cubit;

  @override
  void initState() {
    _cubit = get<MainCubit>();
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocConsumer<MainCubit, MainState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.isSuccessedSignOut) {
            context.go('/onboarding');
          }
        },
        builder: (context, state) => Center(
          child: state.isAuthenticated
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.firebase,
                      width: 160,
                      height: 160,
                      colorFilter: const ColorFilter.mode(
                        BaseColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Currently Logged In as',
                      style: TextStyle(
                          color: BaseColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.email,
                      style: const TextStyle(
                          color: BaseColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.fullName,
                      style: const TextStyle(
                          color: BaseColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Button(
                          text: 'Sign Out',
                          onTap: () {
                            _cubit.signOut();
                          },
                        ),
                      ],
                    )
                  ],
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
