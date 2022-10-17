import 'package:dart_week/app/core/mvp/fwc_presenter.dart';
import 'package:dart_week/app/pages/my_styckers/view/my_stickers_view.dart';

abstract class MyStickerPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
}
