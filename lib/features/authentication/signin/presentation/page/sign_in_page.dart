import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/bases/enums/text_field.dart';
import '../../../../../core/bases/widgets/auth_header.dart';
import '../../../../../core/bases/widgets/button.dart';
import '../../../../../core/bases/widgets/scaffold.dart';
import '../../../../../core/bases/widgets/text_field.dart';
import '../../../../../core/theme/base_colors.dart';
import '../../../../../services/di.dart';
import '../cubit/sign_in_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignInCubit _cubit;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _cubit = get<SignInCubit>();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const AuthHeader(),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                InputField(
                  title: 'Email',
                  hint: 'Insert Youre Email',
                  controller: _email,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Passoword',
                  hint: 'Insert Youre Password',
                  controller: _password,
                  type: TextFieldType.password,
                ),
              ],
            ),
          ),
          BlocListener<SignInCubit, SignInState>(
            bloc: _cubit,
            listener: (context, state) {
             if (state.isSuccess) {
               context.go('/main');
             }
            },
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Button(
                        text: 'Sign In',
                        onTap: () {
                          _cubit.signIn(
                            email: _email.value.text,
                            password: _password.value.text,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account yet? ',
                        style: TextStyle(
                          color: BaseColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.go('/auth/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: BaseColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
