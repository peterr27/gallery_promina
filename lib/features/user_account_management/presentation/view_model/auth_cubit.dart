import 'package:bloc/bloc.dart';

import '../../data/models/user_model.dart';
import '../../data/repos/auth_repo/auth_repo.dart';
import 'auth_cubit_states.dart';

class AuthCubit extends Cubit<AuthCubitStates> {
  final AppAuthRepo authRepo;
  AppUserModel? userModel;
  AuthCubit(this.authRepo) : super(AuthCubitInitial());

  Future login(String email, String password) async {
    emit(AuthCubitLoading());
    final result = await authRepo.login(email, password);
    result.fold((err) {
      emit(
        AuthCubitLoginFail(err.errorMessage),
      );
    }, (user) {
      userModel = user;
      emit(AuthCubitLoginSuccess(userModel!));
    });
  }

  logout() {
    userModel = null;
    emit(AuthCubitInitial());
  }
}
