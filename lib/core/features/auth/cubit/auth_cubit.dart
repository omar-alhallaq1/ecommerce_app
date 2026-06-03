import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app/core/features/auth/modles/login_response_modle.dart';
import 'package:ecommerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/storage_helpar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  void login({required String username, required String password}) async {
    emit(LoadingAuthState());
    final Either<String, LoginResponseModle> res = await _authRepo.login(
      username,
      password,
    );
    res.fold(
      (error) {
        emit(ErrorAuthState(error));
      },
      (right) {
        emit(SuccessAuthState("login successfully"));
      },
    );
  }

  void logout() async {
    sl<StorageHelpar>().removeToken();
  }
}
