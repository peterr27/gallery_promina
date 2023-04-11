import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import '../../../features/photos_gallery/data/repos/gallery_repo_impl.dart';
import '../../../features/user_account_management/data/repos/auth_repo/auth_repo_impl.dart';
import '../api/api_services.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<ImagePicker>(ImagePicker());
  getIt.registerSingleton<AppAuthRepoImpl>(AppAuthRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<GalleryRepoImpl>(GalleryRepoImpl(getIt.get<ApiServices>(), getIt.get<ImagePicker>()));
}
