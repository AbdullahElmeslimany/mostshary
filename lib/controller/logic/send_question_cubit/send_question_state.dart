part of 'send_question_cubit.dart';

@immutable
sealed class SendQuestionState {}

final class SendQuestionInitial extends SendQuestionState {}

final class SuccessMassagesState extends SendQuestionState {}

final class WaitingMassagesState extends SendQuestionState {}

final class FieldMassagesState extends SendQuestionState {}
