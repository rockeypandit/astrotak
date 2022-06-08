import 'package:astrotak/appRepository/appRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'astrotakbloc_event.dart';
part 'astrotakbloc_state.dart';

class AstrotakblocBloc extends Bloc<AstrotakblocEvent, AstrotakblocState> {
  final _astrotakRepository = AppRepository();

  AstrotakblocBloc() : super(AstrotakblocInitial());

  @override
  Stream<AstrotakblocState> mapEventToState(AstrotakblocEvent event) async* {
    if (event is AstrotakRequest) {
      yield AstrotakInprogress();

      try {
        final response = await _astrotakRepository.getAllQuestion();
        yield AstrotakSuccess(astrotak: response);
      } catch (e) {
        yield AstrotakFailure(error: e.toString());
      }
    }
  }
}
