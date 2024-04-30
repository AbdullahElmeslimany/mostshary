import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mostshary/view/login/login.dart';
import '../../controller/logic/login_regester_cubit/login_and_regester_cubit.dart';
import '../../model/textfromfieldcustom.dart';

class RegesterPage extends StatelessWidget {
  const RegesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final regesterkey = GlobalKey<FormState>();
    final reqestercubit = BlocProvider.of<LoginAndRegesterCubit>(context);

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
                          key: regesterkey,
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
                                    controller: nameController,
                                    keyboardType: TextInputType.emailAddress,
                                    backgroundAnable: true,
                                    text: "Full Name"),
                                const Gap(15),
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
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              if (regesterkey.currentState!.validate()) {
                                reqestercubit.regester(
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
                              "have an Account:  ",
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(
                                  const LoginPage(),
                                );
                              },
                              child: const Text(
                                "Login",
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
