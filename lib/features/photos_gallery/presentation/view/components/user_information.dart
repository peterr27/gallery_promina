import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/themes/colors/app_colors.dart';
import '../../../../../core/utils/themes/text_styles/app_text_styles.dart';
import '../../../../user_account_management/presentation/view_model/auth_cubit.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().userModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome\n${user!.name}',
          style: AppTextStyles.userNameStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.whiteColor,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/free-photo/man-with-thumb-up_1368-3701.jpg?size=626&ext=jpg&ga=GA1.2.880645132.1668099314&semt=ais',
          ),
        ),
      ],
    );
  }
}
