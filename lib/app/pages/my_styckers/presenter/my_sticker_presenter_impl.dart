// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_week/app/models/groups_stickers.dart';
import 'package:dart_week/app/pages/my_styckers/view/my_stickers_view.dart';
import 'package:dart_week/app/repository/stickers/stickers_repository.dart';

import './my_sticker_presenter.dart';

class MyStickerPresenterImpl implements MyStickerPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  var album = <GroupsStickers>[];

  MyStickerPresenterImpl({required this.stickersRepository});
  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;
}
