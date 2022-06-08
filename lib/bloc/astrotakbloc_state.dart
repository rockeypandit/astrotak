part of 'astrotakbloc_bloc.dart';

@immutable
abstract class AstrotakblocState {}

class AstrotakblocInitial extends AstrotakblocState {}

class AstrotakInprogress extends AstrotakblocState {}

class AstrotakSuccess extends AstrotakblocState {
  final AstrotakblocBloc astrotak;
  AstrotakSuccess({required this.astrotak});
}

class AstrotakFailure extends AstrotakblocState {
  final String error;
  AstrotakFailure({required this.error});
}
