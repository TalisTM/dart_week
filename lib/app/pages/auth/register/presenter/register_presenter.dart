import 'package:dart_week/app/core/mvp/fwc_presenter.dart';
import 'package:dart_week/app/pages/auth/register/view/register_view.dart';

abstract class RegisterPresenter extends FwcPresenter<RegisterView> {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
