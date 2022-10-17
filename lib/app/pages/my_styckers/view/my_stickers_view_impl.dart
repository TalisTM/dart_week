import 'package:dart_week/app/core/ui/helpers/loader.dart';
import 'package:dart_week/app/core/ui/helpers/messages.dart';
import 'package:dart_week/app/models/groups_stickers.dart';
import 'package:dart_week/app/pages/my_styckers/my_stickers_page.dart';
import 'package:flutter/material.dart';

import './my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickersView {
  var album = <GroupsStickers>[];

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getMyAlbum();
    });
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadedPage(List<GroupsStickers> album) {
    setState(() {
      this.album = album;
    });
  }
}
