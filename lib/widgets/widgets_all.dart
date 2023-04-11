import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resources/app_styles.dart';

InkWell buttonOnboarding(
    BuildContext context, bool isNavigate, Widget pushNavigate) {
  return InkWell(
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
      if (isNavigate) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => pushNavigate),
        );
      }
    },
  );
}

Container lineContainer(Color color){
  return Container(
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(color: color),        
        color: color,
      ),
    );
}

Container circleContainer(Color color){
  return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Styles.greyColor),
        color: color,
      ),
    );
}

TextField textFieldInputVerifyCode(TextEditingController textEditingController){
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