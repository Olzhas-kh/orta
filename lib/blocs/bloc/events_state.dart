part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

class AddEventLoading extends EventsState {}
class AddEventSuccess extends EventsState {}
class AddEventFailed extends EventsState {
  final String message;

  AddEventFailed(this.message);
}
