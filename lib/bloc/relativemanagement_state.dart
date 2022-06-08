part of 'relativemanagement_bloc.dart';

@immutable
abstract class RelativemanagementState {}

class RelativemanagementInitial extends RelativemanagementState {}

class GetAllRelativesInProgress extends RelativemanagementState {}

class GetAllRelativesSuccess extends RelativemanagementState {
  final String rel;
  GetAllRelativesSuccess({required this.rel});
}

class GetAllRelativesFailure extends RelativemanagementState {
  final String error;
  GetAllRelativesFailure({required this.error});
}

class GetLocationFailure extends RelativemanagementState {
  final String error;
  GetLocationFailure({required this.error});
}

class GetLocationInProgress extends RelativemanagementState {}

class GetLocationSuccess extends RelativemanagementState {
  final List<Location> locations;
  GetLocationSuccess({required this.locations});
}
