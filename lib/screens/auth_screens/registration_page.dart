import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/screens/bottom_bar.dart';
import 'package:orta/screens/auth_screens/login_page.dart';
import 'package:orta/screens/auth_screens/verify_code.dart';

import '../../resources/app_styles.dart';
import '../../widgets/text_field_input.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signUpWithPhoneNumber(String phoneNumber) async {
  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
      Fluttertoast.showToast(msg: "Phone number automatically verified");
    },
    verificationFailed: (FirebaseAuthException e) {
      Fluttertoast.showToast(msg: e.toString());
    },
    codeSent: (String verificationId, int? resendToken) {
      // Save the verification ID somewhere to use later
      // Navigate to the verification screen to enter the code
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}


class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telephoneNumberController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _telephoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.white,
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BottomBar(),
                        ),
                      );
                    },
                    child: const Text(
                      "Зайти как гость",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Registration',
                style: Styles.headLineStyle1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Введите номер телефона, на него придет код подтверждения",
                style: TextStyle(color: Styles.greyColor),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldInput(
                hintText: 'Номер телефона',
                textInputType: TextInputType.number,
                textEditingController: _telephoneNumberController,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration: ShapeDecoration(
                    color: Styles.greyColorButton,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "Получить код",
                    style: Styles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                onTap: () {
                
                      signUpWithPhoneNumber(_telephoneNumberController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));    
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Продолжая, вы подтверждаете свое согласие с',
                      style: TextStyle(color: Styles.greyColor),
                    ),
                    const Text(
                      'Политикой конфиденциальности',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 220,
              ),
              const Center(
                  child: Text(
                "или",
                textAlign: TextAlign.center,
              )),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppPngImages.gmail),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(AppPngImages.icloud),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Center(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    child: const Text("Войти в свой аккаунт")),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
