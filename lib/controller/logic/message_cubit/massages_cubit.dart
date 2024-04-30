import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'massages_state.dart';

class MassagesCubit extends Cubit<MassagesState> {
  MassagesCubit() : super(MassagesInitial());
  bool loading = false;
  CollectionReference pref = FirebaseFirestore.instance.collection("messages");
  List dataMessage = [];
  getDataMessage() async {
    pref.orderBy('time', descending: true).snapshots().listen((event) {
      dataMessage.clear();
      dataMessage.addAll(event.docs);
      emit(GetDataMessageSuccess(dataList: dataMessage, loading: loading));
    });
  }

  delete() async {
    for (var element in dataMessage) {
      pref.doc(element.id).delete();
    }
  }
}
