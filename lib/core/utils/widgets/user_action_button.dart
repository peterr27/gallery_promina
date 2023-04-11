import 'package:flutter/material.dart';
import 'package:gallery/core/utils/extensions/app_extensions.dart';

import '../themes/colors/app_colors.dart';

class UserActionBtn extends StatelessWidget {
  const UserActionBtn({required this.btnName, required this.imageUrl, required this.action, Key? key}) : super(key: key);
  final String btnName;
  final String imageUrl;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.whiteColor, foregroundColor: AppColors.blackColor),
        onPressed: action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            20.wsh,
            Text(btnName),
            20.wsh,
          ],
        ),
      ),
    );
  }
}
