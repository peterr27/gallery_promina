import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/api/api_services.dart';
import '../../../../core/utils/errors/error.dart';
import '../models/photo_model.dart';
import 'gallery_repo.dart';

class GalleryRepoImpl implements GalleryRepo {
  final ApiServices apiServices;
  final ImagePicker picker;
  GalleryRepoImpl(this.apiServices, this.picker);
  @override
  Future uploadImage({required ImageSource source, required String userToken}) async {
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        FormData formData = FormData.fromMap({
          'img': await MultipartFile.fromFile(image.path),
        });
        Options options = Options(
          headers: {
            'Authorization': 'Bearer $userToken',
          },
        );
        final Response response = await apiServices.post(payload: formData, endPoint: 'upload', options: options);
        final data = response.data as Map<String, dynamic>;
        return right(data);
      } else {
        return;
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e).errorMessage);
      } else {
        return left(RegularFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<AppPhotoModel>>> getUserImages({required String userToken}) async {
    List<AppPhotoModel> models = [];
    try {
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $userToken',
        },
      );
      final result = await apiServices.get(endpoint: 'my-gallery', options: options);
      final data = result as Map<String, dynamic>;
      final imagesUrl = data['data']['images'] as List<dynamic>;
      for (var element in imagesUrl) {
        models.add(AppPhotoModel(element));
      }
      return right(models);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(RegularFailure(e.toString()));
      }
    }
  }
}
