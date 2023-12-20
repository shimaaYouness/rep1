import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/water/presentation/components/bill_component.dart';
import 'package:untitled/features/water/presentation/components/briza_component.dart';
import 'package:untitled/features/water/presentation/components/year_prov_component.dart';
import 'package:untitled/features/water/presentation/providers/year_provider.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/screen_size_manager.dart';
import '../components/bills_component.dart';
import '../providers/bill_provider.dart';
import '../providers/get_all_briza_provider.dart';

class WaterScreen extends StatelessWidget {
  WaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrizaProvider prov = Provider.of<BrizaProvider>(context);
    BillProvider billProvider = Provider.of<BillProvider>(context);
   // billProvider.getAllBills();

    return Scaffold(
      backgroundColor: ColorManager.grey300,
      appBar: AppBar(
        backgroundColor: ColorManager.darkPrimary,
        title: Text(
          ' استعلام فواتير المياه',
          style: TextStyle(
              fontFamily: FontManager.primaryFontFamily,
              fontSize: 25,
              color: ColorManager.offWhite),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.table_view, size: 30),
            tooltip: 'الطلبات السابقه',
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(75),
                        topLeft: Radius.circular(75))),
                context: context,
                builder: (context) {
                  return Container();
                },
              ).whenComplete(() => null);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            tooltip: 'اضافه عداد',
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(75),
                        topLeft: Radius.circular(75))),
                context: context,
                builder: (context) {
                  return Container();
                },
              ).whenComplete(() => null);
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
          create: (context) => BrizaProvider(),
          builder: (context, child) {
            if (!prov.checkMeter) {
              prov.getAllBriza();
              return Center(
                  child: CircularProgressIndicator(
                color: ColorManager.darkPrimary,
              ));
            } else {
              if (prov.allBrizaList!.length != 0) {
                return Column(
                  children: [
                    YearComponent(),
                    BillComponent(),
                    //YearComponent(billProvider),
                    // ChangeNotifierProvider(
                    //   create: (context) => BillProvider(),
                    //   child:  BillComponent(),
                    // ),
                    ChangeNotifierProvider(
                      create: (context) => BrizaProvider(),
                      child:  BrizaComponent(),
                    ),
                  ],
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "لا توجد بيانات عدادات مسجلة علي رقم عملك",
                    style: TextStyle(
                      color: ColorManager.darkGrey,
                      fontFamily: FontManager.primaryFontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSizeManager.resize(
                          originalSize: 15, resizeWidth: true),
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}
