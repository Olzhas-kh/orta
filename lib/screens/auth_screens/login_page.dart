import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/bottom_bar.dart';
import 'package:orta/screens/auth_screens/registration_page.dart';

import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/text_field_input.dart';

import '../../services/firebase_methods/auth_methods.dart';
import '../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailNumberController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailNumberController.dispose();
  }

void loginUser() async {
    setState(() {
      _isLoading = false;
    });

    String res = await AuthMethods().signInUser(
        email: _emailNumberController.text, password: _passwordController.text);
    if (res == 'success') {
      if(mounted){

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const BottomBar(
            ),
          ),
          (route) => false);
      }

      setState(() {
        _isLoading = true;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
      showSnackBar(res, context);
    }
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
                'Войти',
                style: Styles.headLineStyle1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Введите email и пароль, указанные при регистрации",
                style: TextStyle(color: Styles.greyColor),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldInput(
                hintText: 'Email',
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
                      borderSide:
                             BorderSide(color: Styles.blueAppColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegistrationPage()));
                      },
                      child: const Text(
                        "У вас нет аккаунта?",
                        textAlign: TextAlign.end,
                      )),
                ],
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
                    color: Styles.blueAppColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "Батырма",
                    style: Styles.headLineStyle2.copyWith(color: Styles.white),
                  ),
                ),
                onTap: () {
                  loginUser();
          //         Navigator.of(context).pushAndRemoveUntil(
          // MaterialPageRoute(
          //   builder: (context) => const BottomBar(
          //   ),
          // ),
          // (route) => false);
             },


                
              ),
              const SizedBox(




                height: 10,
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
            ],
          ),
        ),
      ]),
    );
  }
}
