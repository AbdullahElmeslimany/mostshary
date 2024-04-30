part of 'login_and_regester_cubit.dart';

@immutable
sealed class LoginAndRegesterState {}

final class LoginAndRegesterInitial extends LoginAndRegesterState {}

final class FieldErrorState extends LoginAndRegesterState {
  final String error;
  FieldErrorState({required this.error});
}
