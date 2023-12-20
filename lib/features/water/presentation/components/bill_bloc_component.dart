import 'package:flutter/material.dart';
import 'package:untitled/core/utils/enums.dart';
import 'package:untitled/features/water/presentation/controller/water_bloc.dart';
import 'package:untitled/features/water/presentation/controller/water_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/briza.dart';
import '../providers/get_all_briza_provider.dart';

class BillComponent extends StatelessWidget {
   BillComponent({Key? key}) : super(key: key);

  List<bool> selected = [];

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double heightSiza = queryData.size.height - 350;

    // List<Briza>? brizaList = Provider.of<BrizaProvider>(context).allBrizaList;
    // Failure? failure = Provider.of<BrizaProvider>(context).failure;

    return BlocBuilder<WaterBloc, WaterState>(
      buildWhen: (previous, current)=>
      previous.allBillsState != current.allBillsState,
      builder: (context, state) {
        switch (state.allBillsState) {
          case RequestState.loading:
            return SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case RequestState.loaded:
            return Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: heightSiza,
                  //padding: EdgeInsets.all(1),
                  child: ListView.builder(
                      itemCount: state.allBillsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 10,
                          shadowColor: ColorManager.lightPrimary,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                          child: Column(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: <Color>[
                                        ColorManager.lightPrimary,
                                        ColorManager.primary,
                                        ColorManager.darkPrimary
                                      ]),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  ' شهر: ${state.allBillsList[index].fatra_m} ',
                                  style: TextStyle(
                                    fontFamily: FontManager.primaryFontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.white,
                                    fontSize: 20,
                                    //fontSize: ScreenSizeManager.resize(originalSize: 18, resizeWidth: true),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'رقم المأخذ: ${state.allBillsList[index].briza}',
                                        style: TextStyle(
                                          fontFamily:
                                              FontManager.primaryFontFamily,
                                          fontSize: 15,
                                          //fontSize: ScreenSizeManager.resize(originalSize: 15, resizeWidth: true),
                                        ),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'رقم الايصال: ${state.allBillsList[index].esal}',
                                        style: TextStyle(
                                          fontFamily:
                                              FontManager.primaryFontFamily,
                                          //fontSize: ScreenSizeManager.resize(originalSize: 15, resizeWidth: true),
                                          fontSize: 15,
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'القراءه الحاليه: ${state.allBillsList[index].current_read}',
                                      style: TextStyle(
                                        fontFamily: FontManager.primaryFontFamily,
                                        fontSize: 15,
                                        //fontSize: ScreenSizeManager.resize(originalSize: 15, resizeWidth: true),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'القراءه السابقه: ${state.allBillsList[index].prev_read}',
                                      style: TextStyle(
                                        fontFamily: FontManager.primaryFontFamily,
                                        fontSize: 15,
                                        //fontSize: ScreenSizeManager.resize(originalSize: 15, resizeWidth: true),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'كميه الاستهلاك: ${state.allBillsList[index].esthlak}',
                                      style: TextStyle(
                                        fontFamily: FontManager.primaryFontFamily,
                                        // color: Colors.black,
                                        fontSize: 15,
                                        //fontSize: ScreenSizeManager.resize(originalSize: 15, resizeWidth: true),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'اجمالي المبلغ: ${state.allBillsList[index].tot}',
                                      style: TextStyle(
                                        fontFamily: FontManager.primaryFontFamily,
                                        // color: Colors.black,
                                        fontSize: 15,
                                        //fontSize: ScreenSizeManager.resize(originalSize: 15, resizeWidth: true),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
