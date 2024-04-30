import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mostshary/view/chat/chat.dart';

import '../../controller/logic/change_lang/check_en_ar_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CheckEnArCubit>(context);
    // bool activeAR = false;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        actions: [
          InkWell(
            onTap: () {
              cubit.changeEnAr();
            },
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                "lang".tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.travel_explore,
              size: 85,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "nameLogo".tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              textAlign: TextAlign.center,
              "subjectTitle".tr,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 7, 135, 239),
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () {
                  Get.to(const ChatPage());
                },
                child: Text(
                  "titleButtonHome".tr,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
