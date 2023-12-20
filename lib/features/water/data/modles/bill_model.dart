import 'package:untitled/features/water/domain/entities/bill.dart';

class BillModel extends Bill{
  BillModel({
    required super.briza,
    required super.fatra_m,
    required super.esal,
    required super.current_read,
    required super.prev_read,
    required super.esthlak,
    required super.tot,
    required super.fatra_y,

  });

  factory BillModel.fromJson(Map<String, dynamic> json)=>
      BillModel(
        briza:json['briza'].toInt(),
        fatra_m:json['fatra_m'].toInt(),
        esal:json['esal'].toInt(),
        current_read:json['current_read'].toInt(),
        prev_read:json['prev_read'].toInt(),
        tot:json['tot'] == null ? 0.0 : json['tot'].toDouble(),
        esthlak:json['esthlak'] == null ? 0.0 : json['esthlak'].toDouble(),
        fatra_y:json['fatra_y'].toInt(),
      );
}