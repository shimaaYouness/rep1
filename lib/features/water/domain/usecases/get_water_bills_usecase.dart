import 'package:untitled/features/water/domain/entities/bill.dart';
import 'package:untitled/features/water/domain/repository/base_water_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetAllBillsUseCase{

  final BaseWaterRepository baseWaterRepository;

  GetAllBillsUseCase(this.baseWaterRepository);


  Future<Either<Failure, List<Bill>>> call() async{
    return await baseWaterRepository.getAllWaterBills();
  }
}