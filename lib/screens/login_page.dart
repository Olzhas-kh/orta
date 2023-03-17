import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orta/screens/bottom_bar.dart';
import 'package:orta/screens/login_page.dart';
import 'package:orta/screens/registration_page.dart';
import 'package:orta/screens/verify_code.dart';

import '../utils/app_styles.dart';
import '../widgets/text_field_input.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telephoneNumberController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;
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
                    onTap: (){
                      Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const BottomBar(),
                                                      ),
                                                    );
                    },
                    child: const Text("Зайти как гость",style: TextStyle(fontSize: 15),),),
                  const SizedBox(width: 5,),
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
                "Введите номер телефона и пароль, указанные при регистрации",style: TextStyle(color: Styles.greyColor),
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
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: 'Пароль',
                    labelText: "",
                              prefixIcon: Image.asset("assets/images/key.png"),

                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
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
                            const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const RegistrationPage()));

                    },
                    child: const Text("Забыли пароль?",textAlign: TextAlign.end,)),
                ],
              ),
              const SizedBox(height: 15,),
              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration:  ShapeDecoration(
                    color: Styles.greyColorButton,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "Батырма",
                    style: Styles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const BottomBar()));

                },
              ),
              const SizedBox(
                height: 10,
              ),
              
              const SizedBox(
                height: 220,
              ),
              const Center(child:  Text("или", textAlign: TextAlign.center,)),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset("assets/images/gmail.png"),
                const SizedBox(width: 15,),
                Image.asset("assets/images/icloud.png"),
                
              ],),
              
              
            ],
          ),
        ),
      ]),
    );
  }
}




// TextField(
//                 style: TextStyle(color: Colors.black),
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                     hintText: 'Enter your password',
//                     labelText: "",
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         // Based on passwordVisible state choose the icon
//                         _passwordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.grey,
//                       ),
//                       onPressed: () {
//                         // Update the state i.e. toogle the state of passwordVisible variable
//                         setState(() {
//                           _passwordVisible = !_passwordVisible;
//                         });
//                       },
//                     ),
//                     fillColor: Colors.white,
                    
//                     filled: true,
//                     contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                     focusedBorder: OutlineInputBorder(
                      
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide:
//                             const BorderSide(color: Colors.red, width: 2.0)),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide:
//                             const BorderSide(color: Colors.red, width: 2.0)),
//                     floatingLabelBehavior: FloatingLabelBehavior.always),
//                 keyboardType: TextInputType.text,
//                 obscureText: !_passwordVisible,
//               ),