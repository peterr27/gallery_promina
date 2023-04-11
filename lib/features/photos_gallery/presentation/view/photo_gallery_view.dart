import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/themes/colors/app_colors.dart';
import '../../../user_account_management/presentation/view_model/auth_cubit.dart';
import '../view_model/gallery_upload_cubit.dart';
import 'components/user_actions.dart';
import 'components/user_images_gallery_list.dart';
import 'components/user_information.dart';

class PhotoGalleryView extends StatelessWidget {
  const PhotoGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryColor,
              AppColors.whiteColor,
            ],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            final token = context.read<AuthCubit>().userModel!.token;
            BlocProvider.of<GalleryCubit>(context).getImages(userToken: token!);
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height * .25,
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 0),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UserInformation(),
                      UserActions(),
                    ],
                  ),
                ),
              ),
              const UserImagesGalleryGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
