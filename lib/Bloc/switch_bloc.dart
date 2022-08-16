import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvents>((event, emit) {
      emit(const SwitchState(switchValue: true));
    });
    on<SwitchOffEvents>((event, emit) {
      emit(const SwitchState(switchValue: false));
    });
  }
}
