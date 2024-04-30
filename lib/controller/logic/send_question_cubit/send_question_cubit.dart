import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'send_question_state.dart';

class SendQuestionCubit extends Cubit<SendQuestionState> {
  SendQuestionCubit() : super(SendQuestionInitial());
  bool loading = false;
  CollectionReference pref = FirebaseFirestore.instance.collection("messages");
  late DocumentReference questionSend;
  massages({required messges}) async {
    if (messges != "") {
      try {
        loading = true;
        questionSend = await pref.add(
            {"massage": messges, "type": 0, "time": DateTime.now().toString()});
        emit(WaitingMassagesState());
        var headers = {'Content-Type': 'application/json'};
        var data = json.encode({"Q": messges});
        var dio = Dio();
        var response = await dio.request(
          'https://travel-logs.onrender.com/info',
          options: Options(
            method: 'POST',
            receiveDataWhenStatusError: true,
            headers: headers,
          ),
          data: data,
        );

        if (response.statusCode == 200) {
          loading = false;
          await pref.add({
            "massage": response.data["response"],
            "type": 1,
            "time": DateTime.now().toString()
          });
          // .then((value) => getDataMessage());
          log("add A-----------------------");
          emit(SuccessMassagesState());
        } else {
          log(response.statusMessage.toString());
        }
      } on DioException catch (e) {
        loading = false;
        if (DioExceptionType.badResponse == e.type) {
          pref.doc(questionSend.id).delete();
          Fluttertoast.showToast(
              msg:
                  "Please, Write Your Message in English Or in the Context of the Field",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          loading = false;
          emit(FieldMassagesState());
          // getDataMessage();
          log('Connection badResponse');
        }
        log(e.response.toString());
      }
    }
  }
}
