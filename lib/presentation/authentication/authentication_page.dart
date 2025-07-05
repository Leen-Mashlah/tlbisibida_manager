import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lambda_dent_dash/constant/components/custom_text.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';

import 'auth_cubit.dart';

class AuthenticationPage extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, String>(
        listener: (context, state) {
          // This listener will be called whenever the state of AuthCubit changes.
          if (state == 'logged_in') {
            AnimatedSnackBar.material(
              'تم تسجيل الدخول بنجاح!',
              type: AnimatedSnackBarType.success,
              desktopSnackBarPosition: DesktopSnackBarPosition.bottomCenter,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
            locator<NavigationService>().navigateTo(clientsLogPageRoute);
          }
          if (state == 'error') {
            AnimatedSnackBar.material(
              'لم يتم تسجيل الدخول ـ تأكد من المعلومات المدخلة ثم حاول مرة أخرى',
              type: AnimatedSnackBarType.error,
              desktopSnackBarPosition: DesktopSnackBarPosition.bottomCenter,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          }
        },
        builder: (context, state) {
          AuthCubit cubit = context.read<AuthCubit>();
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/teeth_pattern.png',
                  ),
                  repeat: ImageRepeat.repeat,
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      cyan200,
                      cyan100,
                      cyan50,
                      Color.fromARGB(149, 229, 243, 241),
                      cyan50,
                      cyan100,
                      cyan200
                    ])),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(60),
                          bottomLeft: Radius.circular(10),
                        ),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(200, 20, 112, 103),
                              Color.fromARGB(175, 41, 157, 144),
                              Color.fromARGB(175, 41, 157, 144),
                              Color.fromARGB(161, 51, 187, 171),
                              Color.fromARGB(175, 41, 157, 144),
                              Color.fromARGB(175, 41, 157, 144),
                              Color.fromARGB(200, 20, 112, 103),
                            ])),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 62),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 200,
                            height: 200,
                            child:
                                Image(image: AssetImage("assets/logo_v2.png",),),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Colors.black54,
                                      blurRadius: 8,
                                      offset: Offset(1, 1))
                                ],
                                fontSize: 30,
                                color: cyan50,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "البريد الالكتروني",
                              labelStyle: const TextStyle(color: white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: cyan200,
                                    width: 2,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: cyan50,
                                  width: .5,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "كلمة السر",
                              labelStyle: const TextStyle(color: white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: cyan200,
                                    width: 2,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: cyan50,
                                  width: .5,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "تذكّرني",
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black54,
                                            blurRadius: 8,
                                            offset: Offset(1, 1))
                                      ],
                                      color: white,
                                    ),
                                  ),
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: true,
                                    onChanged: (value) {},
                                    checkColor: white,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                  style: const ButtonStyle(
                                      elevation: WidgetStatePropertyAll(0)),
                                  onPressed: () {},
                                  child: const Text(
                                    'هل نسيت كلمة السر؟',
                                    style: TextStyle(color: white, shadows: [
                                      Shadow(
                                          color: Colors.black54,
                                          blurRadius: 8,
                                          offset: Offset(1, 1))
                                    ]),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cubit.login(email.text, password.text);
                            },
                            style: ButtonStyle(
                                shadowColor:
                                    const WidgetStatePropertyAll(cyan200),
                                backgroundColor:
                                    const WidgetStatePropertyAll(cyan200),
                                padding: const WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 60),
                                ),
                                elevation: const WidgetStatePropertyAll(5),
                                backgroundBuilder: (context, states, child) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          cyan200,
                                          cyan50,
                                          cyan200
                                        ])),
                                    child: child,
                                  );
                                },
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        side: const BorderSide(color: cyan500),
                                        borderRadius:
                                            BorderRadius.circular(15)))),
                            child: cubit.state == 'logging_in'
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation<Color>(cyan500))
                                : const CustomText(
                                    text: "تسجيل الدخول", color: cyan500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
