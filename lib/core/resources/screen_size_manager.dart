import 'package:flutter/material.dart';

enum DeviceType { Phone, Tablet }

class ScreenSizeManager{

  static  DeviceType deviceType = DeviceType.Phone;
  final  double defaultScreenSize = .470;
  static final  double defaultScreenWidth = 392.72;
  static final  double defaultScreenHeight = 803.63;

  static double screenWidth =1;
  static double screenHeight =1;
  static final double _screenSize = screenWidth < screenHeight?  screenWidth/ screenHeight : screenHeight/ screenWidth;

  static final double _circleAvatarRadius1Columns = (80 * screenWidth/ 393).floorToDouble();
  static final double _circleAvatarRadius2Columns = (70 * screenWidth/ 393).floorToDouble();
  static final double  _circleAvatarRadius3Columns =(40 * screenWidth/ 393).floorToDouble();
  static final double _circleAvatarRadius4Columns =  (30 * screenWidth / 393).floorToDouble();
  static final double _fixedColumnWidth45 = 45 * screenSize / .470;
  static final double _fixedColumnWidth80 = 80 * screenSize / .470;
  static final double _basicTextSize9 = 9 * screenSize / .470;
  static final double _basicTextSize18 =18* screenSize/ .470;
  static final double _basicTextSize15 =15* screenSize/ .470;
  static final double _basicTextSize14 =14* screenSize/ .470;
  static final double _basicTextSize16 =16* screenSize/ .470;
  static final double _basicTextSize12 =12* screenSize/ .470;
  static final double _basicTextSize30 =30* screenSize/ .470;
  static final double _basicIconSize =40* screenSize/ .470;
  static final double _iconSize30 =30* screenSize/ .470;
  static final double _iconSize35 =35* screenSize/ .470;
  static final double _basicButtonHeight =40* screenSize/ .470;
  static final double _basicButtonWidth =150* screenSize/ .470;
  static final double _screenAspectRatioPortrait = screenHeight/1000;
  static final double _screenAspectRatioLandscape = screenWidth/1000;
  static final double _gridViewAspectRatio = ((screenSize / .470) * 1.6 * 2).floor()/2;
  static double get circleAvatarRadius1Columns => _circleAvatarRadius1Columns;
  static double get circleAvatarRadius2Columns => _circleAvatarRadius2Columns;
  static  double get circleAvatarRadius3Columns => _circleAvatarRadius3Columns;
  static double get circleAvatarRadius4Columns => _circleAvatarRadius4Columns;

  static double get gridViewAspectRatio => _gridViewAspectRatio;
  static double get basicTextSize30 => _basicTextSize30;
  static double get basicTextSize => _basicTextSize18;
  static double get basicTextSize9 => _basicTextSize9;

  static double get basicTextSize15 => _basicTextSize15;
  static double get basicTextSize14 => _basicTextSize14;
  static double get basicTextSize16 => _basicTextSize16;
  static double get basicTextSize12 => _basicTextSize12;
  static double get basicIconSize => _basicIconSize;
  static double get iconSize30 => _iconSize30;
  static double get iconSize35 => _iconSize35;
  static double get fixedColumnWidth45 => _fixedColumnWidth45;
  static double get fixedColumnWidth80 => _fixedColumnWidth80;
  static double get basicButtonHeight => _basicButtonHeight;
  static double get basicButtonWidth => _basicButtonWidth;
  static double get screenAspectRatioPortrait => _screenAspectRatioPortrait;
  static double get screenAspectRatioLandscape => _screenAspectRatioLandscape;
  static double get screenSize => _screenSize;

  static double resize({required double originalSize, bool resizeHeight = false, bool resizeWidth = false, double minSize = 1, double maxSize = 1000}){
     double ret = originalSize;
     if(resizeHeight) ret*=  screenHeight / defaultScreenHeight;
     if(resizeWidth) ret *= screenWidth/ defaultScreenWidth;
    return ret > minSize ? ret> maxSize ? maxSize: ret: minSize;
  }
}