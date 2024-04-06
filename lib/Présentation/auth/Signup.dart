import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:note_app/Custom/Constant.dart';
import 'package:note_app/Custom/CustomButton.dart';
import 'package:note_app/Custom/TextFieldCustom.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController user = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PrimaryColor,
        body: ListView(children: [
          Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Image.asset("assets/img/Logo1.jpg", width: 120),
                      const SizedBox(height: 40),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 15),
                      const Text('Signup to your account',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300)),
                      CustomTextField(
                        text: 'User Name',
                        mycontroller: user,
                        obc: false,
                        validator: (val) {
                          if (val == "") {
                            return "can't be empty";
                          }
                        },
                      ),
                      CustomTextField(
                        text: 'Email',
                        mycontroller: email,
                        obc: false,
                        validator: (val) {
                          if (val == "") {
                            return "can't be empty";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        text: 'Password',
                        mycontroller: password,
                        obc: true,
                        validator: (val) {
                          if (val == "") {
                            return "can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      CustomButton(
                          text: 'Create',
                          cs: Colors.grey,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/Login');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    headerAnimationLoop: false,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: 'The password provided is too weak.',
                                  ).show();
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    headerAnimationLoop: false,
                                    animType: AnimType.rightSlide,
                                    title: 'Eroor',
                                    desc:
                                        'The account already exists for that email.',
                                  ).show();
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          print('cbn');
                          Navigator.pushReplacementNamed(context, '/Login');
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Have an account? ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "Sign in",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])),
          ),
        ]));
  }
}
