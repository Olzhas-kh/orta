import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/fill_form/fill_form2.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/circle_container.dart';
import 'package:orta/widgets/line_container.dart';
import 'package:orta/widgets/text_field_input_name.dart';

class FillForm1 extends StatefulWidget {
  const FillForm1({super.key});

  @override
  State<FillForm1> createState() => _FillForm1State();
}

final TextEditingController _nameTextEditingController =
    TextEditingController();
final TextEditingController _dateTextEditingController =
    TextEditingController();
bool _isChosen = true;

class _FillForm1State extends State<FillForm1> {
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
                CircleContainer(color: Styles.white),
                const SizedBox(
                  width: 5,
                ),
                const LineContainer(color: Color.fromARGB(255, 197, 196, 196)),
                const SizedBox(
                  width: 5,
                ),
                CircleContainer(color: Styles.white),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              '1. Персональные данные',
              style: Styles.headLineStyle1.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Укажите свои данные",
              style: TextStyle(color: Styles.greyColor),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Имя"),
            const SizedBox(
              height: 15,
            ),
            TextFieldInputName(
              hintText: 'Введите свое имя',
              textEditingController: _nameTextEditingController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Дата рождения"),
            const SizedBox(
              height: 15,
            ),
            TextFieldInputName(
              hintText: 'дд.мм.гггг',
              textEditingController: _dateTextEditingController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Ваш пол"),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 55),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              _isChosen ? Styles.greyColor : Styles.greyColor),
                      borderRadius: BorderRadius.circular(20),
                      color: _isChosen ? Styles.greyColor : Styles.white,
                    ),
                    child: Text(
                      "Мужской",
                      style: TextStyle(
                          color: _isChosen ? Styles.white : Colors.black,
                          fontSize: 16),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isChosen = true;
                    });
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 55),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              _isChosen ? Styles.greyColor : Styles.greyColor),
                      borderRadius: BorderRadius.circular(20),
                      color: _isChosen ? Styles.white : Styles.greyColor,
                    ),
                    child: Text(
                      "Женский",
                      style: TextStyle(
                          color: _isChosen ? Colors.black : Styles.white,
                          fontSize: 16),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isChosen = false;
                    });
                  },
                ),
              ],
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
                decoration: ShapeDecoration(
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const FillForm2()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
