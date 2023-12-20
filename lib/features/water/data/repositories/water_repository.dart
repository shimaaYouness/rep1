import 'package:dartz/dartz.dart';
import 'package:untitled/core/error/failure.dart';
import 'package:untitled/features/water/data/datasource/water_data_source.dart';
import 'package:untitled/features/water/domain/entities/bill.dart';
import 'package:untitled/features/water/domain/entities/briza.dart';
import 'package:untitled/features/water/domain/repository/base_water_repository.dart';
import '../../../../../core/error/exceptions.dart';

class WaterRepository extends BaseWaterRepository {
  final BaseWaterDataSource baseWaterRemoteDataSource;

  WaterRepository(this.baseWaterRemoteDataSource);

  @override
  Future<Either<Failure, List<Briza>>> getAllBriza() async {
    final result = await baseWaterRemoteDataSource.getAllBriza();
    try {
      return Right(result as List<Briza>);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Bill>>> getAllWaterBills() async{
    final result = await baseWaterRemoteDataSource.getWaterBills();
    try {
      return Right(result as List<Bill>);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  getBillsByYear(int year) {
    // TODO: implement getBillsByYear
    throw UnimplementedError();
  }
}
