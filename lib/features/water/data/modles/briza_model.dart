import 'package:untitled/features/water/domain/entities/briza.dart';

class BrizaModel extends Briza {
    BrizaModel({
    required super.briza,
    required super.city,
    //required super.status,
  });
    factory BrizaModel.fromJson(Map<String, dynamic> json)=>
       BrizaModel(
          city:json['city'].toInt(),
          briza:json['briza'].toInt(),
          //status:json['status'].toInt(),
      );

}
