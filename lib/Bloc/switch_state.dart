// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switch_bloc.dart';

@immutable
class SwitchState {
  final bool switchValue;
  const SwitchState({
    required this.switchValue,
  });
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
