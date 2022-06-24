// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kunlik/service/firebase/firebase.dart';
import 'package:kunlik/view/auth/view/admin_page.dart';
import 'package:kunlik/view/auth/view/users_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passPhoneNumberController =
      TextEditingController();

  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login to coffee shop')),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKeyEmail,
                child: Column(
                  children: [
                    TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(hintText: "Your email"),
                        validator: (t) =>
                            t!.length < 5 ? "5-tadan kam bo'lmasin" : null),
                    TextFormField(
                        controller: passController,
                        decoration: InputDecoration(hintText: "Your password"),
                        validator: (t) =>
                            t!.length < 5 ? "5-tadan kam bo'lmasin" : null),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration:
                          InputDecoration(hintText: "Your phone number"),
                    ),
                    TextFormField(
                      controller: passPhoneNumberController,
                      decoration: InputDecoration(hintText: "Your password"),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal),
                child: const Text('Sign In'),
                onPressed: () {
                  signIn(context);
                  setState(() {});
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: const Text('Sign Up'),
                onPressed: () {
                  signUpEmail(context);
                  setState(() {});
                },
              ),
              ElevatedButton(
                child: Text('Sign In Phone Number'),
                onPressed: () {
                  signInPhoneNumber(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //akauntga kirish Email orqliy
  Future signIn(BuildContext context) async {
    try {
      if (formKeyEmail.currentState!.validate()) {
        //kirish auth
        await FireService.auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        //admin panelga o'tish
        if (emailController.text == 'admin@gmail.com') {
          if (passController.text == '123456') {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AdminPage(email: emailController.text),
              ),
              (route) => false,
            );
          }
        }
        // user panelga o'tish
        else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => UsersPage(email: emailController.text),
            ),
            (route) => false,
          );
        }
      }
      // akaunt bo'lmasa yoki not'g'ri kiritilsa
      else {
        MyMessenger.messenger(context, 'Fill all fields!', Colors.green);
      }
    } catch (e) {
      MyMessenger.messenger(context, 'Error while sign in: $e', Colors.red);
    }
  }

  //regstratsiya bo'lish Email orqliy
  Future signUpEmail(BuildContext context) async {
    try {
      if (formKeyEmail.currentState!.validate()) {
        //registratsiya auth
        await FireService.auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        //registratsiya database
        await FireService.store
            .collection('users')
            .doc(emailController.text)
            .set({
          'email': emailController.text,
          'password': passController.text,
        });
        //admin panelga o'tish
        if (emailController.text == 'admin@gmail.com') {
          if (passController.text == '123456') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/admin',
              (route) => false,
              arguments: emailController.text,
            );
          }
        }
        // user panelga o'tish
        else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/users',
            (route) => false,
            arguments: emailController.text,
          );
        }
      }
      // akaunt bo'lmasa yoki not'g'ri kiritilsa
      else {
        MyMessenger.messenger(context, 'Fill all fields!', Colors.green);
      }
    } catch (e) {
      MyMessenger.messenger(context, 'Error while sign in: $e', Colors.red);
    }
  }

  //akauntga kirish Phone Number orqliy //!Oxwamadi nomer bn kirish
  Future signInPhoneNumber(BuildContext context) async {
    try {
      if (formKey2.currentState!.validate()) {
        //kirish auth
        await FireService.auth.signInWithPhoneNumber(
          phoneNumberController.text,
        );
        await FireService.auth.confirmPasswordReset(
          code: passController.text,
          newPassword: passController.text,
        );

        //registratsiya database
        await FireService.store
            .collection('users')
            .doc(phoneNumberController.text)
            .set({
          'phone': phoneNumberController.text,
          'password': passController.text,
        });
        //admin panelga o'tish
        if (phoneNumberController.text == '+1234567890') {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/admin',
            (route) => false,
            arguments: phoneNumberController.text,
          );
        }
        // user panelga o'tish
        else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/user',
            (route) => false,
            arguments: phoneNumberController.text,
          );
        }
      }
      // akaunt bo'lmasa yoki not'g'ri kiritilsa
      else {
        MyMessenger.messenger(context, 'Fill all fields!', Colors.green);
      }
    } catch (e) {
      MyMessenger.messenger(context, 'Error while sign in', Colors.red);
      print(e);
    }
  }
}

class MyMessenger {
  static messenger(BuildContext context, text, color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), backgroundColor: color),
    );
  }
}

class FirebaseAuthHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  login(String phonenumber, String password) async {}
  Future signup(
      BuildContext context,
      String phonenumber,
      // RoundedLoadingButtonController btnController,
      void Function(String, int?) codeSent) async {
    // btnController.start();

    await auth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (AuthCredential authCredential) {
        // btnController.success();

        Future.delayed(const Duration(seconds: 2), () {
          // btnController.stop();
        });

        auth
            .signInWithCredential(authCredential)
            .then((UserCredential result) {})
            .catchError((e) {
          print(e);
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
        // btnController.stop();

        // showErrorSnackBar(context, "Ups, Registration failed!");
      },
      codeSent: codeSent,
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        // btnController.stop();
      },
    );
  }
}
//+998977503171