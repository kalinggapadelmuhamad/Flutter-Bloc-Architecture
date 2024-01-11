part of 'register_bloc.dart';

sealed class RegisterEvent {}

class DoRegister extends RegisterEvent {
  final RegisterRequestModel model;
  DoRegister({
    required this.model,
  });
}
