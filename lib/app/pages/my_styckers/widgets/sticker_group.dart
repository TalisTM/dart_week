// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_week/app/core/ui/styles/colors_app.dart';
import 'package:dart_week/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class StickerGroup extends StatelessWidget {
  const StickerGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.asset(
                    "assets/images/flags/BRA.png",
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Brasil",
              style: context.textStyles.titleBlack.copyWith(
                fontSize: 26,
              ),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Sticker(index: index);
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final int index;
  const Sticker({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: index % 2 == 0 ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: index % 2 == 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  "1",
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              "BRA",
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: index % 2 == 0 ? Colors.white : Colors.black,
              ),
            ),
            Text(
              "$index",
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: index % 2 == 0 ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
