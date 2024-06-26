// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_copa_2022_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_copa_2022_app/app/models/groups_stickers.dart';
import 'package:fwc_album_copa_2022_app/app/models/user_stickers_model.dart';
import 'package:fwc_album_copa_2022_app/app/pages/home/mystickers/presenter/my_stickers_presenter.dart';

class StickerGroup extends StatelessWidget {
  final GroupStickers group;
  final String statusFilter;
  const StickerGroup(
      {super.key, required this.group, required this.statusFilter});

  @override
  Widget build(BuildContext context) {
    print('build $hashCode');
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              final stickersNumber = '${group.stickerStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickersNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                stickerNumber: stickersNumber,
                sticker: sticker,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );
              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicated > 0) {
                  return stickerWidget;
                }
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final presenter = context.get<MyStickersPresenter>();
        await Navigator.of(context).pushNamed('/sticker-detail', arguments: {
          'countryCode': countryCode,
          'stickerNumber': stickerNumber,
          'countryName': countryName,
          'stickerUser': sticker,
        });
        presenter.refresh();
      },
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(children: [
          Visibility(
            visible: (sticker?.duplicated ?? 0) > 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(2),
              child: Text(
                sticker?.duplicated.toString() ?? '',
                style: context.textStyles.textSecundaryFontMedium.copyWith(
                  color: context.colors.yellow,
                ),
              ),
            ),
          ),
          Text(
            countryCode,
            style: context.textStyles.textSecundaryFontExtraBold.copyWith(
              color: sticker != null ? Colors.white : Colors.black,
            ),
          ),
          Text(
            stickerNumber,
            style: context.textStyles.textSecundaryFontExtraBold.copyWith(
              color: sticker != null ? Colors.white : Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
