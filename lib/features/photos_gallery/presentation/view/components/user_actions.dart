import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/utils/extensions/app_extensions.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/user_action_button.dart';
import '../../../../user_account_management/presentation/view_model/auth_cubit.dart';
import '../../view_model/gallery_upload_cubit.dart';

class UserActions extends StatelessWidget {
  const UserActions({Key? key}) : super(key: key);
  Future<void> _showOptionsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.white.withOpacity(.7),
          elevation: 0,
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserActionBtn(
                  btnName: 'Gallery',
                  imageUrl: AppConstants.cameraIcon,
                  action: () {
                    final token = context.read<AuthCubit>().userModel?.token;
                    BlocProvider.of<GalleryCubit>(context).upload(source: ImageSource.gallery, userToken: token!);
                    Navigator.pop(context);
                    BlocProvider.of<GalleryCubit>(context).getImages(userToken: token);
                  },
                ),
                20.wsv,
                UserActionBtn(
                  btnName: 'Camera',
                  imageUrl: AppConstants.cameraIcon,
                  action: () {
                    final token = context.read<AuthCubit>().userModel?.token;
                    BlocProvider.of<GalleryCubit>(context).upload(source: ImageSource.camera, userToken: token!);
                    Navigator.pop(context);
                    BlocProvider.of<GalleryCubit>(context).getImages(userToken: token);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UserActionBtn(
            btnName: 'LOGOUT',
            imageUrl: AppConstants.logoutIcon,
            action: () {
              context.read<AuthCubit>().logout();
            },
          ),
        ),
        20.wsh,
        Expanded(
          child: UserActionBtn(
            btnName: 'UPLOAD',
            imageUrl: AppConstants.uploadIcon,
            action: () {
              _showOptionsDialog(context);
            },
          ),
        ),
      ],
    );
  }
}
