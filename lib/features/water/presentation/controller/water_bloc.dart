import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:untitled/features/water/domain/entities/briza.dart';
import 'package:untitled/features/water/presentation/controller/water_event.dart';
import 'package:untitled/features/water/presentation/controller/water_state.dart';
import '../../../../core/utils/enums.dart';
import '../../../water/domain/usecases/get_all_briza_usecase.dart';
import '../../domain/entities/bill.dart';
import '../../domain/usecases/get_water_bills_usecase.dart';

class WaterBloc extends Bloc<WaterEvent, WaterState> {
  final GetAllBrizaUseCae getAllBrizaUseCae;
  final GetAllBillsUseCase getALlBillsUseCase;

  WaterBloc(this.getAllBrizaUseCae, this.getALlBillsUseCase) : super(const WaterState()) {
    on<GetALLBrizaEvent>(_getAllBriza);
    on<GetALLBillEvent>((event, emit) async {
      final result = await getALlBillsUseCase.call();
      result.fold((l) {
        emit(
          state.copywith(
              allBillsState: RequestState.error,
              allBillsMessage: l.message),
        );
      }, (r) {
        emit(
          state.copywith(
            allBillsList: r as List<Bill>,
            allBillsState: RequestState.loaded,
          ),
        );
      });
    });
  }

  FutureOr<void> _getAllBriza(GetALLBrizaEvent event, Emitter<WaterState> emit) async {

      final result = await getAllBrizaUseCae.call();
      result.fold((l) {
        emit(
          //WaterState() replaced by copywith to add data to the same object not create new obj every change
          state.copywith(
            allBrizaState: RequestState.error,
            allBrizaMessage: l.message,
          ),
        );
      }, (r) {
        emit(
          state.copywith(
            allBrizaList: r as List<Briza>,
            allBrizaState: RequestState.loaded,
          ),
        );
      });
  }
}

