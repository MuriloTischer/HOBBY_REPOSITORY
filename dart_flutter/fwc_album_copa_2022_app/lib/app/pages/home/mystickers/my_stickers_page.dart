// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/presenter/my_stickers_presenter.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/view/my_stickers_view_impl.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/widgets/sticker_group.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/widgets/sticker_group_filter.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/widgets/sticker_status_filter.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickersPresenter presenter;

  const MyStickersPage({
    super.key,
    required this.presenter,
  });

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickersViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              StickerStatusFilter(
                filterSelected: statusFilter,
              ),
               StickerGroupFilter(countries: countries),
            ],
          ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final group = album[index];
                return StickerGroup(group: group, statusFilter: statusFilter,);
              },
              childCount: album.length,
            ),
          ),
        ],
      ),
    );
  }
}
