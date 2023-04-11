
import '../../data/models/user_model.dart';

abstract class AuthCubitStates {}

class AuthCubitInitial extends AuthCubitStates {}

class AuthCubitLoading extends AuthCubitStates {}

class AuthCubitLoginSuccess extends AuthCubitStates {
  AppUserModel user;
  AuthCubitLoginSuccess(this.user);
}

class AuthCubitLoginFail extends AuthCubitStates {
  String err;
  AuthCubitLoginFail(this.err);
}
