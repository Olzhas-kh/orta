part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class AddEvent extends EventsEvent {
  final String uid;
  final String name;
  final String description;
  final DateTime eventDate;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final List<String> interest;
  final int count;
  final int price;
  final String format;

  AddEvent(
      {required this.uid,
      required this.name,
      required this.description,
      required this.eventDate,
      required this.startTime,
      required this.endTime,
      required this.location,
      required this.interest,
      required this.count,
      required this.price,
      required this.format});
}
