import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class Briza extends Equatable {
  int briza;
  int city;
  //int status;


  Briza({
    required this.briza,
    required this.city,
    //required this.status,
});

  @override

  List<Object?> get props => [briza, city/*, status*/ ];
}