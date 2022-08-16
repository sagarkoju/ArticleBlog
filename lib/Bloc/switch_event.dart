part of 'switch_bloc.dart';

@immutable
abstract class SwitchEvent {}

class SwitchOnEvents extends SwitchEvent {}

class SwitchOffEvents extends SwitchEvent {}
