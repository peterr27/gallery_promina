import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api/api_services.dart';
import '../../../../../core/utils/errors/error.dart';
import '../../models/user_model.dart';
import 'auth_repo.dart';

class AppAuthRepoImpl implements AppAuthRepo {
  final AppApiDataServices apiServices;
  AppAuthRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, AppUserModel>> login(String email, String password) async {
    try {
      final Response response = await apiServices.post(payload: {'email': email, 'password': password}, endPoint: 'auth/login');
      final Map<String, dynamic> data = response.data;
      //checking for response cause it always return statusCode 200 which is not right !!
      //TODO FOR PROMINA BACKEND : fix response status code when user send wrong data;
      if (!data.containsKey('error_message')) {
        final userInfo = data['user'];
        final userData = {'name': userInfo['name'], 'id': userInfo['id'], 'token': data['token']};
        final AppUserModel userModel = AppUserModel.fromJson(userData);
        return right(userModel);
      } else {
        return left(ServerFailure('Incorrect Data, Please Try Again.'));
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(RegularFailure(e.toString()));
      }
    }
  }
}
