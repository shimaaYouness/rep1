import 'package:flutter/material.dart';
import 'package:untitled/features/water/data/datasource/water_data_source.dart';
import 'package:untitled/features/water/data/repositories/water_repository.dart';
import 'package:untitled/features/water/domain/repository/base_water_repository.dart';
import 'package:untitled/features/water/domain/usecases/get_all_briza_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/water/presentation/components/bill_component.dart';
import 'package:untitled/features/water/presentation/components/briza_component.dart';
import 'package:untitled/features/water/presentation/controller/water_event.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/screen_size_manager.dart';
import '../../../../core/services/service_locator.dart';
import '../controller/water_bloc.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<WaterBloc>()
          ..add(GetALLBrizaEvent())
          ..add(GetALLBillEvent()),
        child: Scaffold(
          backgroundColor: ColorManager.grey300,
          appBar: AppBar(
            backgroundColor: ColorManager.darkPrimary,
            title: Text(
              ' استعلام فواتير المياه',
              style: TextStyle(
                fontFamily: FontManager.primaryFontFamily,
                fontSize: ScreenSizeManager.basicTextSize,
              ),
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
          body: Column(
            children: [
              //BillComponent(),
              BrizaComponent(),
            ],
          ),
        ));
  }

  @override
  void initState() {
    //_getData();
  }

  void _getData() async {
    BaseWaterDataSource baseWaterDataSource = WaterDataSource();
    BaseWaterRepository waterRepository = WaterRepository(baseWaterDataSource);
    final reult = await GetAllBrizaUseCae(waterRepository).call();
    reult.fold((l) => null, (r) {
      print(r);
    });
  }
}
