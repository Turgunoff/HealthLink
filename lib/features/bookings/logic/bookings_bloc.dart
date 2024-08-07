import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsInitial()) {
    on<BookingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
