

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/bottom_bar.dart';
import 'package:orta/screens/auth_screens/login_page.dart';

import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/fill_form/fill_form1.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/text_field_input.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}


  bool _passwordVisible = false;


class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailNumberController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailNumberController.dispose();
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
                "Введите email",
                style: TextStyle(color: Styles.greyColor),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldInput(
                hintText: 'email',
                textInputType: TextInputType.text,
                textEditingController: _emailNumberController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Пароль',
                    labelText: "",
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                       borderSide:
                             BorderSide(color: Styles.blueAppColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0)),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration: ShapeDecoration(
                    color: Styles.blueAppColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "Registration",
                    style: Styles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                onTap: () {
                      VarForRegister.email = _emailNumberController.text;
                      VarForRegister.password = _passwordController.text;
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FillForm1()));    
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
