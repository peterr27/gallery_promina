import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/error.dart';
import '../../models/user_model.dart';

abstract class AppAuthRepo {
  Future<Either<Failure, AppUserModel>> login(String email, String password);
}
