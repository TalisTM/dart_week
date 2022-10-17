// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_week/app/pages/my_styckers/presenter/my_sticker_presenter.dart';
import 'package:dart_week/app/pages/my_styckers/view/my_stickers_view_impl.dart';
import 'package:dart_week/app/pages/my_styckers/widgets/sticker_group.dart';
import 'package:dart_week/app/pages/my_styckers/widgets/sticker_group_filter.dart';
import 'package:flutter/material.dart';

import 'widgets/sticker_status_filter.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickerPresenter presenter;
  const MyStickersPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickersViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minhas figurinhas'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [StickerStatusFilter(filterSelected: ""), StickerGroupFilter()],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return StickerGroup();
              }, childCount: album.length),
            )
          ],
        ));
  }
}
