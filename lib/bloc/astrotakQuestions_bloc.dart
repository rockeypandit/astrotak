import 'package:astrotak/appRepository/appRepository.dart';
import 'package:astrotak/model/Question.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'astrotakQuestions_event.dart';
part 'astrotakQuestions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final _astrotakRepository = AppRepository();

  QuestionsBloc() : super(QuestionsInitial()) {
    on<QuestionsEvent>((event, emit) async {
      if (event is QuestionsRequest) {
        emit(QuestionsInprogress());
        try {
          final response = await _astrotakRepository.getAllQuestion();
          emit(QuestionsSuccess(astrotak: response));
        } catch (e) {
          emit(QuestionsFailure(error: e.toString()));
        }
      }
    });
  }
}
