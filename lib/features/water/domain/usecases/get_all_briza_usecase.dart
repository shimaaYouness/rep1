import 'package:dartz/dartz.dart';
import 'package:untitled/features/water/domain/entities/briza.dart';
import 'package:untitled/features/water/domain/repository/base_water_repository.dart';
import '../../../../core/error/failure.dart';

class GetAllBrizaUseCae{

  final BaseWaterRepository baseWaterRepository;

  GetAllBrizaUseCae(this.baseWaterRepository);


  Future<Either<Failure, List<Briza>>> call() async{
  return await baseWaterRepository.getAllBriza();
  }
}