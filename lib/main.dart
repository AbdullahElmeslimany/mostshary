import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mostshary/view/login/login.dart';
import 'controller/logic/change_lang/check_en_ar_cubit.dart';
import 'controller/logic/message_cubit/massages_cubit.dart';
import 'controller/logic/send_question_cubit/send_question_cubit.dart';
import 'controller/locale/locale.dart';
import 'controller/locale/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MassagesCubit()),
        BlocProvider(create: (context) => SendQuestionCubit()),
        BlocProvider(create: (context) => CheckEnArCubit()),
      ],
      child: GetMaterialApp(
        title: 'Mostshary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        locale: Get.deviceLocale,
        translations: MyLocale(),
        home: const LoginPage(),
      ),
    );
  }
}
