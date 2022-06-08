part of 'astrotakQuestions_bloc.dart';

@immutable
abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsInprogress extends QuestionsState {}

class QuestionsSuccess extends QuestionsState {
  final List<Question> astrotak;
  QuestionsSuccess({required this.astrotak});
}

class QuestionsFailure extends QuestionsState {
  final String error;
  QuestionsFailure({required this.error});
}
