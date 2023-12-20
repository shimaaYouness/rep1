import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:untitled/features/water/data/datasource/water_data_source.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../data/repositories/water_repository.dart';
import '../../domain/entities/briza.dart';
import '../../../water/domain/usecases/get_all_briza_usecase.dart';
import 'bill_provider.dart';
class BrizaProvider extends  ChangeNotifier{
   List<Briza>? allBrizaList ;
   Failure? failure;
   RequestState state = RequestState.loading;
   BillProvider billProvider =BillProvider();
   bool checkMeter = false;
   BrizaProvider();

   FutureOr<void> getAllBriza() async{
     WaterRepository baseWaterRepository = WaterRepository(WaterDataSource());

    final result = await GetAllBrizaUseCae(baseWaterRepository).call();

    result.fold(
          (l) {
            allBrizaList =null;
            failure = l;
            state = RequestState.error;
            notifyListeners();
      },
          (r) {
            allBrizaList =r;
            failure = null;
            state = RequestState.loaded;
            if(r.isNotEmpty)
              billProvider.getAllBills();
            notifyListeners();
      },
    );
     checkMeter = true;
     notifyListeners();
  }

}