import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/models/photo_model.dart';
import '../../data/repos/gallery_repo.dart';

abstract class GalleryCubitStates {}

class GalleryInitialState extends GalleryCubitStates {}

class GalleryUploadSuccess extends GalleryCubitStates {
  List<AppPhotoModel> models;
  GalleryUploadSuccess(this.models);
}

class GalleryLoadingState extends GalleryCubitStates {
  GalleryLoadingState();
}

class GalleryUploadFailed extends GalleryCubitStates {
  dynamic response;
  GalleryUploadFailed(this.response);
}

class GalleryCubit extends Cubit<GalleryCubitStates> {
  final GalleryRepo repo;
  GalleryCubit(this.repo) : super(GalleryInitialState());

  Future upload({required ImageSource source, required String userToken}) async {
    emit(GalleryLoadingState());
    final result = await repo.uploadImage(source: source, userToken: userToken);
    if (result != null) {
      result.fold((err) => emit(GalleryUploadFailed(err)), (photo) {
        getImages(userToken: userToken);
      });
    }
  }

  Future getImages({required String userToken}) async {
    emit(GalleryLoadingState());
    final result = await repo.getUserImages(userToken: userToken);
    result.fold(
        (l) => emit(
              GalleryUploadFailed(l.errorMessage),
            ),
        (r) => emit(GalleryUploadSuccess(r)));
  }
}
