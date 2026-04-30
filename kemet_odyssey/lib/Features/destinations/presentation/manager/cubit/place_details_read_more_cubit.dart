import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/place_details_read_more_state.dart';

class PlaceDetailsReadMoreCubit extends Cubit<PlaceDetailsReadMoreState> {
  PlaceDetailsReadMoreCubit() : super(const PlaceDetailsReadMoreState());

  void toggleDescription() {
    emit(
      state.copyWith(
        isDescriptionExpanded: !state.isDescriptionExpanded,
      ),
    );
  }

  void toggleHistory() {
    emit(
      state.copyWith(
        isHistoryExpanded: !state.isHistoryExpanded,
      ),
    );
  }
}
