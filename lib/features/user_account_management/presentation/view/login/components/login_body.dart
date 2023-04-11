import 'package:flutter/material.dart';
import 'package:gallery/core/utils/extensions/app_extensions.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/themes/text_styles/app_text_styles.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          AppConstants.appTitle,
          style: AppTextStyles.titleStyle,
          textAlign: TextAlign.center,
        ),
        40.wsv,
        const LoginForm(),
      ],
    );
  }
}
