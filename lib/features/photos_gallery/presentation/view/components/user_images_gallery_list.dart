import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_account_management/presentation/view_model/auth_cubit.dart';
import '../../view_model/gallery_upload_cubit.dart';

class UserImagesGalleryGrid extends StatefulWidget {
  const UserImagesGalleryGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<UserImagesGalleryGrid> createState() => _UserImagesGalleryGridState();
}

class _UserImagesGalleryGridState extends State<UserImagesGalleryGrid> {
  @override
  void initState() {
    final token = context.read<AuthCubit>().userModel!.token;
    BlocProvider.of<GalleryCubit>(context).getImages(userToken: token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryCubitStates>(builder: (context, state) {
      if (state is GalleryLoadingState) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is GalleryUploadSuccess) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final reversedImages = state.models.reversed.toList();
              return Card(
                clipBehavior: Clip.hardEdge,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  reversedImages[index].imgUrl,
                  fit: BoxFit.fill,
                ),
              );
            }, childCount: state.models.length),
          ),
        );
      } else if (state is GalleryUploadFailed) {
        return SliverToBoxAdapter(
          child: Text(state.response.toString()),
        );
      } else {
        return const SliverToBoxAdapter(
          child: Text('unhandled case '),
        );
      }
    });
  }
}
