import 'package:astrotak/appRepository/appRepository.dart';
import 'package:astrotak/model/Location.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'relativemanagement_event.dart';
part 'relativemanagement_state.dart';

class RelativemanagementBloc
    extends Bloc<RelativemanagementEvent, RelativemanagementState> {
  final _astrotakRepository = AppRepository();

  RelativemanagementBloc() : super(RelativemanagementInitial()) {
    on<RelativemanagementEvent>((event, emit) async {
      if (event is GetAllRelatives) {
        emit(GetAllRelativesInProgress());
        try {
          final response = await _astrotakRepository.getRelativeList();
          emit(GetAllRelativesSuccess(rel: response));
        } catch (e) {
          emit(GetAllRelativesFailure(error: e.toString()));
        }
      }

      if (event is GetLocationRequest) {
        emit(GetLocationInProgress());
        try {
          final response = await _astrotakRepository.getAllLocation(event.loc);
          emit(GetLocationSuccess(locations: response));
        } catch (e) {
          emit(GetLocationFailure(error: e.toString()));
        }
      }
    });
  }
}
