import 'package:dart_week/app/pages/my_styckers/my_stickers_page.dart';
import 'package:dart_week/app/pages/my_styckers/presenter/my_sticker_presenter.dart';
import 'package:dart_week/app/pages/my_styckers/presenter/my_sticker_presenter_impl.dart';
import 'package:dart_week/app/repository/stickers/stickers_repository.dart';
import 'package:dart_week/app/repository/stickers/stickers_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class MyStickersRoute extends FlutterGetItPageRoute {
  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>((i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<MyStickerPresenter>((i) => MyStickerPresenterImpl(
              stickersRepository: i(),
            ))
      ];

  @override
  WidgetBuilder get page => (context) => MyStickersPage(presenter: context.get());
}
