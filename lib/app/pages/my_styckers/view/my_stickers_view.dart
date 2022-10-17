import 'package:dart_week/app/models/groups_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupsStickers> album);

  void error(String message);
}
