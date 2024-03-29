import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/blocs/auth_bloc/auth_bloc.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/bottom_bar.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/utils/utils.dart';
import 'package:orta/widgets/circle_container.dart';
import 'package:orta/widgets/line_container.dart';
import 'package:orta/widgets/text_field_input_name.dart';

class FillForm3 extends StatefulWidget {
  const FillForm3({super.key});

  @override
  State<FillForm3> createState() => _FillForm3State();
}

final TextEditingController _interesTextEditingController =
    TextEditingController();

class _FillForm3State extends State<FillForm3> {
  int tag = 1;
  List<String> interests = [
    "Football",
    "Volleyball",
    "Chess",
    "Basketball",
    "Tennis",
    "Baseball",
    "Bawling",
    "Golf",
    "Judo",
    "Badminton"
  ];
  List<String> tags = [];
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Styles.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppSvgImages.backIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  CircleContainer(color: Styles.blueAppColor),
                  const SizedBox(
                    width: 5,
                  ),
                   LineContainer(
                      color:  Styles.blueAppColor),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleContainer(color:  Styles.blueAppColor),
                  const SizedBox(
                    width: 5,
                  ),
                   LineContainer(
                      color:  Styles.blueAppColor),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleContainer(color: Styles.blueAppColor),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text(
                '3. Выберите интересы',
                style: Styles.headLineStyle1.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldInputName(
                hintText: 'Интересы',
                textEditingController: _interesTextEditingController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              ChipsChoice<String>.multiple(
                value: tags,
                onChanged: (value) {
                  setState(() {
                    tags = value;
                  });
                },
                choiceItems: C2Choice.listFrom(
                    source: interests, value: (i, v) => v, label: (i, v) => v),
                choiceActiveStyle: C2ChoiceStyle(
                  color:  Styles.orangeAppColor,
                  borderColor: Styles.orangeAppColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                choiceStyle: const C2ChoiceStyle(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                wrapped: true,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    circlarIndicator(context);
                  }
                  if (state is RegisterFailed) {
                    showSnackBar(state.failedText, context);
                  }
                  if (state is RegisterSuccess) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const BottomBar(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                      decoration: ShapeDecoration(
                        color: Styles.blueAppColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      child: Text(
                        "Батырма",
                        style:
                            Styles.headLineStyle2.copyWith(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      context.read<AuthBloc>().add(RegisterEvent(
                          email: VarForRegister.email!,
                          name: VarForRegister.name!,
                          birthDay: VarForRegister.birthDay!,
                          password: VarForRegister.password!,
                          city: VarForRegister.city!,
                          interest: tags,
                          gender: VarForRegister.gender!));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
