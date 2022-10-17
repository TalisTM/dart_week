// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dart_week/app/core/exceptions/unauthorized_exception.dart';
import 'package:dart_week/app/pages/auth/login/view/login_view.dart';
import 'package:dart_week/app/services/login/login_service.dart';

import './login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;
  late final LoginView _view;

  LoginPresenterImpl({required this.loginService});

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException {
      _view.error("Usuário ou senha inválidos");
    } catch (e, s) {
      log("Erro ao realiar login", error: e, stackTrace: s);
      _view.error("Erro ao ralizar login");
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
