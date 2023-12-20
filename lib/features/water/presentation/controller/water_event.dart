import 'package:equatable/equatable.dart';

abstract class WaterEvent extends Equatable {
  const WaterEvent();

  @override
  List<Object> get props => [];
}

class GetALLBrizaEvent extends WaterEvent {}

class GetALLBillEvent extends WaterEvent {}

