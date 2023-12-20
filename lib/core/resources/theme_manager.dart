import 'package:flutter/material.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../resources/font_manager.dart';
import 'color_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.lightPrimary,

    //card-view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    
    //button theme
        buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.lightPrimary,
        ),
    
    //elevated button theme(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
      )
    ),
    
    //Text theme
textTheme: TextTheme(
  displayLarge: getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
  headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
  titleMedium: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
  labelLarge: getRegularStyle(color: ColorManager.grey,),
  bodyLarge: getRegularStyle(color: ColorManager.grey)
),
    
    //input decoration theme(Text form)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error,),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1p5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1p5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1p5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1p5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),


  );
}
