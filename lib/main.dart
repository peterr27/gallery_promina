import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/routing/app_router.dart';
import 'core/utils/services_locator/service_locator.dart';
import 'core/utils/themes/app_theme.dart';
import 'features/photos_gallery/data/repos/gallery_repo_impl.dart';
import 'features/photos_gallery/presentation/view_model/gallery_upload_cubit.dart';
import 'features/user_account_management/data/repos/auth_repo/auth_repo_impl.dart';
import 'features/user_account_management/presentation/view_model/auth_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AppGallery());
}

class AppGallery extends StatelessWidget {
  const AppGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt.get<AppAuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GalleryCubit(getIt.get<GalleryRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: AppTheme().getAppThemeData(),
      ),
    );
  }
}
