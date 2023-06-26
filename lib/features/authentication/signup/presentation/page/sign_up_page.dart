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
import '../cubit/sign_up_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpCubit _cubit;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _fullName;

  @override
  void initState() {
    _cubit = get<SignUpCubit>();
    _email = TextEditingController();
    _password = TextEditingController();
    _fullName = TextEditingController();
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
                  title: 'Full Name',
                  hint: 'Insert Youre Full Name',
                  controller: _fullName,
                ),
                const SizedBox(
                  height: 20,
                ),
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
          BlocListener<SignUpCubit, SignUpState>(
            bloc: _cubit,
            listener: (context, state) {
              if (state.isSuccess) {
                context.go('/auth/signin');
              }
            },
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Button(
                        text: 'Sign Up',
                        onTap: () {
                          _cubit.signUp(
                            email: _email.value.text,
                            password: _password.value.text,
                            fullName: _fullName.value.text,
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
                        'Already Have an Account? ',
                        style: TextStyle(
                          color: BaseColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.go('/auth/signin');
                        },
                        child: const Text(
                          'Sign In',
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
