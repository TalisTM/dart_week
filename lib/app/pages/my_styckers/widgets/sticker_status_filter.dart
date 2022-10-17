import 'package:dart_week/app/core/ui/styles/button_styles.dart';
import 'package:dart_week/app/core/ui/styles/colors_app.dart';
import 'package:dart_week/app/core/ui/styles/text_styles.dart';
import 'package:dart_week/app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;

  const StickerStatusFilter({Key? key, required this.filterSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.height,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {},
            style: context.buttonStyles.yellowButton,
            labelStyle: context.textStyles.textSecondaryFontMedium.copyWith(
              color: context.colors.primary,
            ),
            label: "Todas",
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {},
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: "Faltando",
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {},
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: "Repetidas",
          )
        ],
      ),
    );
  }
}
