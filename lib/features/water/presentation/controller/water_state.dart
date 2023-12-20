import '../../../../core/utils/enums.dart';
import '../../domain/entities/bill.dart';
import '../../domain/entities/briza.dart';
import 'package:equatable/equatable.dart';


class WaterState extends Equatable{
  final List<Briza> allBrizaList;
  final RequestState allBrizaState;
  final String allBrizaMessage;
  final List<Bill> allBillsList;
  final RequestState allBillsState;
  final String allBillsMessage;

  const WaterState({
    this.allBrizaList =const [],
    this.allBrizaState = RequestState.loading,
    this.allBrizaMessage = '',
    this.allBillsList =const [],
    this.allBillsState = RequestState.loading,
    this.allBillsMessage = '',
});
  //بنستخدم copywith عشان عندي اكتر من state وكل واحده بترجع obj جديد من ال waterState فهلاقي event بيرجع الداتا
  //و event لا وجزء بيترسم فال ui وجزء بيفضل يلود عشان كده ال copywith بتقارن كل prop فال state لو فاضيه بترجع اللي موجوده فال this ال obj الاصلي لو مش فاضيه بتضيف علي نفس الاوبجيكت
  WaterState copywith({
     List<Briza>? allBrizaList,
     RequestState? allBrizaState,
     String? allBrizaMessage,
     List<Bill>? allBillsList,
     RequestState? allBillsState,
     String? allBillsMessage,
}){
    return WaterState(
        allBrizaList : allBrizaList ?? this.allBrizaList,
        allBrizaState : allBrizaState ?? this.allBrizaState,
        allBrizaMessage : allBrizaMessage ?? this.allBrizaMessage,
        allBillsList : allBillsList ?? this.allBillsList,
        allBillsState : allBillsState ?? this.allBillsState,
        allBillsMessage : allBillsMessage ?? this.allBillsMessage
    );
  }

  @override
  List<Object?> get props => [
    allBrizaList,
    allBrizaState,
    allBrizaMessage,
    allBillsList,
    allBillsState,
    allBillsMessage
  ];
}