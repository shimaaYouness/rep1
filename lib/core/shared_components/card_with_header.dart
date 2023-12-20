import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/screen_size_manager.dart';

class CardWithHeader extends StatelessWidget {
  const CardWithHeader(
      {required this.headerText,
      required this.bodyText,
      this.isSelected = false,
      super.key});

  final String headerText;
  final String bodyText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: EdgeInsets.only(bottom: ),
      // alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              ColorManager.darkPrimary,
              ColorManager.primary,
              ColorManager.darkPrimary,
            ]),
      ),
      child: Material(
        color: ColorManager.transparent,
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Column(
            textDirection: TextDirection.rtl,
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: isSelected
                        ? ColorManager.lightOrange
                        : ColorManager.grey300,
                  ),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 2.5, right: 2.5),
                  child: Text(
                    headerText,
                    style: TextStyle(
                        fontFamily: FontManager.primaryFontFamily,
                        color: ColorManager.darkPrimary,
                        fontSize: 15,
                        //ScreenSizeManager.resize(originalSize: 16, resizeHeight: true),
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.only(
                    top: ScreenSizeManager.resize(originalSize: 15, resizeHeight: true),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    bodyText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontManager.primaryFontFamily,
                        fontSize: 15,
                        //ScreenSizeManager.resize(originalSize: 16, resizeHeight: true),
                        color: ColorManager.offWhite),
                  )),
            ]),
      ),
    );
  }
}
