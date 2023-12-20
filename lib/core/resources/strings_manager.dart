import 'package:flutter/material.dart';
import '../resources/screen_size_manager.dart';
import 'color_manager.dart';
class AppStrings{
  static const String noRouteFound = 'No Route Found';
}
class Labels{
  ///////Labels///////
  static const String save ='حفظ';
  static const String noDataFound ='لا توجد بيانات مسجلة';
  ////////MSG////////
  static const String completeData = 'برجاء استكمال البيانات ';
  static const String personalCardNotAvailable = 'ميزة الكروت الشخصية متاحة حاليا للوظائف الرئيسية فقط';
}

class MSG{
  static  showErrorMsg(BuildContext context, String msgTitle){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            elevation: 5,
            margin: const EdgeInsets.all(8),
            behavior: SnackBarBehavior.floating ,
            duration: const Duration(seconds: 4),
            backgroundColor: ColorManager.error,
            content:  Directionality(textDirection: TextDirection.rtl,
                child: Text(msgTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenSizeManager.basicTextSize16),
                  textAlign: TextAlign.center,)
            )
        )
    );
  }
 /* static showAwesomeErrorMsg(BuildContext context, String msgBody, String msgTitle){
    AwesomeDialog(autoDismiss: true,
      context: context,
      useRootNavigator: true,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: msgTitle,
      desc: msgBody,
      // btnCancelText: 'تم',
      //  btnCancelOnPress: () {},
    )..show();
  }*/
}