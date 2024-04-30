part of 'check_en_ar_cubit.dart';

@immutable
sealed class CheckEnArState {}

final class CheckEnArInitial extends CheckEnArState {}

final class ResultEnArState extends CheckEnArState {}
