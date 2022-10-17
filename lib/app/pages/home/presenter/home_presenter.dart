import 'package:dart_week/app/core/mvp/fwc_presenter.dart';
import 'package:dart_week/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
