import 'package:get_it/get_it.dart';
import 'package:untitled/features/water/domain/usecases/get_water_bills_usecase.dart';

import '../../features/water/data/datasource/water_data_source.dart';
import '../../features/water/data/repositories/water_repository.dart';
import '../../features/water/domain/repository/base_water_repository.dart';
import '../../features/water/domain/usecases/get_all_briza_usecase.dart';
import '../../features/water/presentation/controller/water_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {
  void init() {

    sl.registerFactory(() => WaterBloc(sl(),sl()));
    /// Use Cases
    sl.registerLazySingleton(() => GetAllBrizaUseCae(sl()));
    sl.registerLazySingleton(() => GetAllBillsUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseWaterRepository>(
            () => WaterRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseWaterDataSource>(
            () => WaterDataSource());
  }
}