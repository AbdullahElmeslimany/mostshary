import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mostshary/controller/logic/send_question_cubit/send_question_cubit.dart';
import 'package:mostshary/view/chat/bubbles.dart';
import '../../controller/logic/message_cubit/massages_cubit.dart';
import '../../model/textfromfieldcustom.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MassagesCubit>(context);
    final cubitSend = BlocProvider.of<SendQuestionCubit>(context);
    cubit.getDataMessage();
    List dataList = [];
    TextEditingController messges = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            cubit.delete();
            Get.back();
          },
        ),
        title: const Text(
          "MostsharyBot",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  return BlocConsumer<MassagesCubit, MassagesState>(
                    listener: (context, state) {
                      if (state is GetDataMessageSuccess) {
                        dataList = state.dataList;
                      }
                    },
                    builder: (context, state) {
                      if (state is GetDataMessageSuccess) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                reverse: true,
                                itemCount: dataList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return dataList[index]["type"] == 1
                                      ? ChatBubble(
                                          message:
                                              "${dataList[index]["massage"]}")
                                      : ChatBubbleFriend(
                                          message:
                                              "${dataList[index]["massage"]}");
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }
                      return Center(
                          child: Lottie.asset('assets/loading2.json'));
                    },
                  );
                }),
              ),
              BlocBuilder<SendQuestionCubit, SendQuestionState>(
                builder: (context, state) {
                  if (state is WaitingMassagesState) {
                    return Lottie.asset('assets/loading2.json');
                  }
                  return Container();
                },
              ),
              Container(
                height: 75,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    textFromFieldcustom(
                        width: MediaQuery.sizeOf(context).width - 70,
                        controller: messges,
                        text: "Massage"),
                    InkWell(
                      onDoubleTap: () {
                        cubit.delete();
                      },
                      child: IconButton(
                        onPressed: () async {
                          cubitSend.massages(messges: messges.text);
                          messges.clear();
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
