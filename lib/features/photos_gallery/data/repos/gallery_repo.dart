import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/errors/error.dart';
import '../models/photo_model.dart';

abstract class GalleryRepo {
  Future uploadImage({required ImageSource source, required String userToken});
  Future<Either<Failure, List<AppPhotoModel>>> getUserImages({required String userToken});
}
