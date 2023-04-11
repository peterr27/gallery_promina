import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/features/photos_gallery/presentation/view/photo_gallery_view.dart';
import 'package:gallery/features/user_account_management/presentation/view/login/login_view.dart';
import 'package:gallery/features/user_account_management/presentation/view_model/auth_cubit.dart';
import 'package:gallery/features/user_account_management/presentation/view_model/auth_cubit_states.dart';


class AppStarterPoint extends StatefulWidget {
  const AppStarterPoint({Key? key}) : super(key: key);

  @override
  State<AppStarterPoint> createState() => _AppStarterPointState();
}

class _AppStarterPointState extends State<AppStarterPoint> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitStates>(
      builder: (context, state) {
        if (state is AuthCubitLoginSuccess) {
          return const PhotoGalleryView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
