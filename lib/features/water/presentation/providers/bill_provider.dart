import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:untitled/features/water/data/datasource/water_data_source.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../data/repositories/water_repository.dart';
import '../../domain/entities/bill.dart';
import '../../domain/usecases/get_water_bills_usecase.dart';

class BillProvider extends ChangeNotifier {
  List<Bill>? allBillsList = [];
  List<Bill>? billsByYear = [];
  Failure? failure;
  RequestState? state= RequestState.loading ;
  int? year;
  BillProvider();
  void updateYear(int updatedYear){
    year = updatedYear;
    notifyListeners();
  }



  FutureOr<void> getAllBills() async {
    WaterRepository baseWaterRepository = WaterRepository(WaterDataSource());

    final result = await GetAllBillsUseCase(baseWaterRepository).call();

    result.fold(
      (l) {
        allBillsList = null;
        failure = l;
        state = RequestState.error;
        notifyListeners();
      },
      (r) async{
        allBillsList = r;
        failure = null;
        if(year ==null)
          year = DateTime.now().year;
        await getBillsByYear(year!);
        state = RequestState.loaded;
        print('${state} ${billsByYear!.length}');
        notifyListeners();
      },
    );

  }

  Future<void> getBillsByYear(int year) async{
    billsByYear!.clear();

    billsByYear!.addAll(allBillsList!.where((element) => element.fatra_y == year));
    // _waterBillsByYear.forEach((element) {
    //   totalEsthlak += element.esthlak;
    // });
    // _waterBillsByYear.forEach((element) {
    //   totalMoney += element.tot;
    // });
    billsByYear!.sort((a, b) => b.fatra_m.compareTo(a.fatra_m, ), );
    state = RequestState.loaded;
    notifyListeners();
  }
}
