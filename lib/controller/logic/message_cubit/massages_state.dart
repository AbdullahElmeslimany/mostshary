part of 'massages_cubit.dart';

@immutable
sealed class MassagesState {}

final class MassagesInitial extends MassagesState {}

final class SuccessMassagesState extends MassagesState {
  final dataList;
  final loading;
  SuccessMassagesState(this.dataList, this.loading);
}

final class FieldMassagesState extends MassagesState {}

final class GetDataMessageSuccess extends MassagesState {
  final dataList;
  final loading;

  GetDataMessageSuccess({this.loading, this.dataList});
}
