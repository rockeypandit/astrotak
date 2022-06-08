part of 'relativemanagement_bloc.dart';

@immutable
abstract class RelativemanagementEvent {}

class GetAllRelatives extends RelativemanagementEvent {
  GetAllRelatives();
}

class GetLocationRequest extends RelativemanagementEvent {
  String loc;
  GetLocationRequest(this.loc);
}
