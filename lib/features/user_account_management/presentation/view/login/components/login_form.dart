import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/utils/extensions/app_extensions.dart';
import '../../../../../../core/utils/themes/colors/app_colors.dart';
import '../../../../../../core/utils/themes/text_styles/app_text_styles.dart';
import '../../../view_model/auth_cubit.dart';
import '../../../view_model/auth_cubit_states.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                const Text(
                  'LOG IN',
                  style: AppTextStyles.loginStyle,
                ),
                30.wsv,
                const LoginFormBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFormBody extends StatefulWidget {
  const LoginFormBody({Key? key}) : super(key: key);

  @override
  State<LoginFormBody> createState() => _LoginFormBodyState();
}

class _LoginFormBodyState extends State<LoginFormBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field Required';
              } else if (!value.contains('@')) {
                return 'badlyFormattedEmail';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'username'),
          ),
          30.wsv,
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => {isVisible = !isVisible});
                },
                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility, color: AppColors.greyColor),
              ),
            ),
            obscureText: isVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field Required';
              }
              return null;
            },
          ),
          30.wsv,
          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  FocusManager.instance.primaryFocus?.unfocus();
                  await BlocProvider.of<AuthCubit>(context).login(_emailController.text.trim(), _passwordController.text.trim());
                }
              },
              child: BlocBuilder<AuthCubit, AuthCubitStates>(
                builder: (context, state) {
                  if (state is AuthCubitLoading) {
                    return const CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    );
                  } else if (state is AuthCubitLoginSuccess) {
                    return const Text('Login Success');
                  } else {
                    return const Text('SUBMIT');
                  }
                },
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthCubitStates>(builder: (context, state) {
            if (state is AuthCubitLoginFail) {
              return Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Text(
                    state.err,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}
