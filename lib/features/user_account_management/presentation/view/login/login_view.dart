import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import 'components/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppConstants.loginBg),
              fit: BoxFit.fill,
            ),
          ),
          child: const LoginBody(),
        ),
      ),
    );
  }
}
