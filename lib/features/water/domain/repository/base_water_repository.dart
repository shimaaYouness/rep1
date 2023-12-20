import 'package:dartz/dartz.dart';
import 'package:untitled/features/water/domain/entities/briza.dart';
import '../../../../core/error/failure.dart';
import '../entities/bill.dart';

//contract methods
abstract class BaseWaterRepository{

  Future<Either<Failure, List<Briza>>> getAllBriza ();

  Future<Either<Failure, List<Bill>>> getAllWaterBills();

  getBillsByYear(int year);
}