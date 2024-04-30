import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mostshary/controller/logic/login_regester_cubit/login_and_regester_cubit.dart';
import 'package:mostshary/view/regester/regester.dart';
import '../../model/textfromfieldcustom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final loginkey = GlobalKey<FormState>();
    final logincubit = BlocProvider.of<LoginAndRegesterCubit>(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: false,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.travel_explore,
                          size: 100,
                        ),
                        const Gap(45),
                        Form(
                          key: loginkey,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textFromFieldcustom(
                                    hight: 19,
                                    width:
                                        MediaQuery.sizeOf(context).width - 50,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    backgroundAnable: true,
                                    text: "Email"),
                                const Gap(15),
                                textFromFieldcustom(
                                    hight: 19,
                                    width:
                                        MediaQuery.sizeOf(context).width - 50,
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    backgroundAnable: true,
                                    pass: true,
                                    text: "Password"),
                                const Gap(8),
                              ],
                            ),
                          ),
                        ),
                        const Gap(30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue[800],
                          ),
                          width: MediaQuery.sizeOf(context).width / 1.4,
                          child: MaterialButton(
                            height: 30,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              if (loginkey.currentState!.validate()) {
                                logincubit.login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                        ),
                        const Gap(25),
                        Row(
                          children: [
                            const Text(
                              "Don't have an Account:  ",
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const RegesterPage());
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
