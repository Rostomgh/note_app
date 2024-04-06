import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Custom/ButtonSign_in_google.dart';
import 'package:note_app/Custom/Constant.dart';
import 'package:note_app/Custom/CustomButton.dart';
import 'package:note_app/Custom/TextFieldCustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PrimaryColor,
        body: ListView(
          children: [Form(
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
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Login to your account',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot your password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 41, 40, 40),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'Login',
                        cs: Colors.grey,
                        onPressed: ()async {
          
                          if (formKey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text,
                                    password: password.text);
                          Navigator.pushReplacementNamed(context, 'Home');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'No user found for that email.',
                              ).show();
                            } else if (e.code == 'wrong-password') {
                              print(
                                  'Wrong password provided for that user.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                            
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Wrong password provided for that user.',
                              ).show();
                            }
                          }
                        } else {
                          print("Not valid");
                        }
                        
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Button_Google(
                        onpress: () {},
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          print('cbn');
                          Navigator.pushReplacementNamed(context, '/Sign_up');
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Create an account? ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "Sign up",
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
