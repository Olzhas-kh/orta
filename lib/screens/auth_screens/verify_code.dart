import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/fill_form/fill_form1.dart';

import 'package:orta/screens/auth_screens/login_page.dart';
import 'package:orta/screens/auth_screens/registration_page.dart';
import 'package:pinput/pinput.dart';

import '../../resources/app_styles.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyNumberController1 = TextEditingController();
  final TextEditingController _verifyNumberController2 = TextEditingController();
  final TextEditingController _verifyNumberController3 = TextEditingController();
  final TextEditingController _verifyNumberController4 = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _verifyNumberController1.dispose();
    _verifyNumberController2.dispose();
    _verifyNumberController3.dispose();
    _verifyNumberController4.dispose();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  IconButton(icon: const Icon(Icons.arrow_back),
                  onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const RegistrationPage()));
                  }
                  ),
                  const Text(
                    "Верификация",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                'Введите код из смс',
                style: Styles.headLineStyle1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Мы отправили код на номер +7 777 002 45 56",
                style: TextStyle(color: Styles.greyColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
              child: Pinput(
                
                length: 4,
                onCompleted: (value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const FillForm1()));
                },
                defaultPinTheme: PinTheme(
                  
                  width: 47,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 240, 239, 239),
                  ),
                ),
              ),
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
                    "Отправить повторно",
                    style: Styles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                onTap: () {},
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
                SvgPicture.asset(AppSvgImages.gmail),
                  const SizedBox(
                    width: 15,
                  ),
                   SvgPicture.asset(AppSvgImages.icloud),
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
