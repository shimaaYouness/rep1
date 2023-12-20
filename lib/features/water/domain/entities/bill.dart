import 'dart:ffi';

import 'package:equatable/equatable.dart';
class Bill extends Equatable{
  int briza;
  int fatra_m;
  int esal;
  int current_read;
  int prev_read;
  num esthlak;
  num tot;
  int fatra_y ;

  Bill({
    required this.briza,
    required this.fatra_m,
    required this.esal,
    required this.current_read,
    required this.prev_read,
    required this.esthlak,
    required this.tot,
    required this.fatra_y,
  });
  @override

  List<Object?> get props => [briza, fatra_m, esal, current_read, prev_read, esthlak,tot];
}