
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orta/services/firebase_methods/firestore_methods.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    on<AddEvent>((event, emit) async {
      emit(AddEventLoading());

      try {
        await FireStoreMethods().addEvents(
            event.uid,
            event.name,
            event.description,
            event.eventDate,
            event.eventDate,
            event.endTime,
            event.location,
            event.interest,
            event.count,
            event.price,
            event.format,
            event.file
            );
            log("success");

          emit(AddEventSuccess());
      } catch (e) {
        emit(AddEventFailed(e.toString()));
      }
    });
  }
}
