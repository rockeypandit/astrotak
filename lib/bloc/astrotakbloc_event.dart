part of 'astrotakbloc_bloc.dart';

@immutable
abstract class AstrotakblocEvent {}

class AstrotakRequest extends AstrotakblocEvent {
  final String name;

  AstrotakRequest({required this.name});
}
