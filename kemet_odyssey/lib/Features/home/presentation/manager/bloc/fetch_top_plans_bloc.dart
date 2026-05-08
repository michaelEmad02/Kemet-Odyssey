import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/domain/usecases/fetch_top_plan_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_top_plans_event.dart';
part 'fetch_top_plans_state.dart';

class FetchTopPlansBloc extends Bloc<FetchTopPlansEvent, FetchTopPlansState> {
  final FetchTopPlanUseCase fetchTopPlanUseCase;
  FetchTopPlansBloc(this.fetchTopPlanUseCase) : super(FetchTopPlansInitial()) {
    on<FetchTopPlansEvent>((event, emit) async {
      emit(FetchTopPlansLoading());
      final result = await fetchTopPlanUseCase.execute();
      result.fold(
          (error) => emit(FetchTopPlansFailure(errorMessage: error.message)),
          (topPlans) => emit(FetchTopPlansLoaded(topPlans: topPlans)));
    });
  }
}
