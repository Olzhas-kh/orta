import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/events.dart';
import 'package:orta/resources/app_styles.dart';
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
    return Scaffold(
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
                CircleContainer(color: Styles.greyColorButton),
                const SizedBox(
                  width: 5,
                ),
                const LineContainer(color: Color.fromARGB(255, 197, 196, 196)),
                const SizedBox(
                  width: 5,
                ),
                CircleContainer(color: Styles.greyColorButton),
                const SizedBox(
                  width: 5,
                ),
                const LineContainer(color: Color.fromARGB(255, 197, 196, 196)),
                const SizedBox(
                  width: 5,
                ),
                CircleContainer(color: Styles.greyColorButton),
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
              choiceActiveStyle:  C2ChoiceStyle(
                color: Colors.black,
                borderColor: Styles.greyColorButton,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              choiceStyle: const C2ChoiceStyle(color: Colors.black,borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),),
                wrapped: true,
                
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        decoration:  ShapeDecoration(
                          color: Styles.greyColorButton,
                          shape:  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        child: Text(
                          "Батырма",
                          style: Styles.headLineStyle2.copyWith(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                         Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Events()));
                      },
                    ),
          ],
        ),
      ),
    );
  }
}
