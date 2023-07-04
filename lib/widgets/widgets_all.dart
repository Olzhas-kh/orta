import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/screens/auth_screens/login_page.dart';
import 'package:orta/widgets/row_spacer.dart';
import '../resources/app_styles.dart';

GestureDetector buttonOnboarding(
    BuildContext context, bool isNavigate, Widget pushNavigate) {

  return GestureDetector(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      decoration: ShapeDecoration(
        color: Styles.blueAppColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      child: Text(
        
        "Әрі қарай",
        textAlign: TextAlign.center,
        style: Styles.headLineStyle2.copyWith(color: Colors.white),
      ),
    ),
    onTap: () {
      if (isNavigate) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => pushNavigate),
        );
      }
    },
  );
}

InkWell textButtonOnboarding(BuildContext context){
  return InkWell(
    child: Text("Өткізу", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Styles.white),),
    onTap: () {
       Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
    },
  );
}
Container lineContainerOnBoarding(Color color) {
  return Container(
    width: 120,
    decoration: BoxDecoration(
      border: Border.all(color: color),
      color: color,
    ),
  );
}
 

Container lineContainer(Color color) {
  return Container(
    width: 90,
    decoration: BoxDecoration(
      border: Border.all(color: color),
      color: color,
    ),
  );
}

Container circleContainer(Color color) {
  return Container(
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Styles.greyColor),
      color: color,
    ),
  );
}

TextField textFieldInputVerifyCode(
    TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Styles.greyColorButton)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Styles.greyColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    ),
    style: Styles.headLineStyle2,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    inputFormatters: [
      LengthLimitingTextInputFormatter(1),
      FilteringTextInputFormatter.digitsOnly
    ],
  );
}

Container indicatorTab(Color color) {
  return Container(
    width: 57,
    height: 2,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: color),
  );
}

Text organizationTitleText(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Styles.black),
  );
}

TextField textFieldInputText(TextEditingController textEditingController, String hintLabelText, Icon? prefixIcon, Icon? suffixIcon, TextInputType textInputType){
  return TextField(
                onChanged: (value) {},
                controller: textEditingController,
                keyboardType: textInputType,
                decoration:  InputDecoration(
                    labelText: hintLabelText,
                    hintText: hintLabelText,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))
                        ),
              );
}

GestureDetector backButton(BuildContext context){
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
      child: Row(
        children: const[
           Icon(Icons.arrow_back),
           RowSpacer(1),
          Text("Артқа")
        ],
      ),
    );
  
}

GestureDetector nextButton(BuildContext context,Widget navigationPage,Function function){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => navigationPage));
             function;
    },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Styles.greyDark,
        ),
        child: const Text("Келесі"),
      )
    );
  
}

Container profilePhoto(){
  return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(shape: BoxShape.circle,
                color: Styles.greyColor,
                ),
                child: Image.asset(AppPngImages.personPhoto),
              );
}



