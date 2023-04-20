import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/screens/fill_form/fill_form3.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/circle_container.dart';
import 'package:orta/widgets/line_container.dart';

import '../../resources/app_svg_images.dart';

class FillForm2 extends StatefulWidget {
  const FillForm2({super.key});

  @override
  State<FillForm2> createState() => _FillForm2State();
}


const List<String> cities = [
  "Almaty",
  "Astana",
  "Shymkent",
  "Taraz",
  "Aktau",
  "Kyzylorda",
  "Aktobe",
  "Oral",
  "Semei",
  "Oskemen",
  "Kokshetau",
  
];
  ScrollController scrollController = ScrollController();

class _FillForm2State extends State<FillForm2> {
    String dropdownValue = cities.first;

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
                const LineContainer(color: Color.fromARGB(255, 105, 103, 103)),
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
                CircleContainer(color: Styles.white),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              '2. Выберите свой город',
              style: Styles.headLineStyle1.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            
                 Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Styles.greyColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                   child: DropdownButton<String>(
                       value: dropdownValue,
                         underline: const SizedBox(),

                       icon: const Padding(
                         padding: EdgeInsets.only(left: 250),
                         child: Icon(Icons.arrow_downward),
                       ),
                       
                       elevation: 16,
                       style: const TextStyle(color: Colors.black, fontSize: 16),
                       
                       onChanged: (String? value) {
                         // This is called when the user selects an item.
                         setState(() {
                           dropdownValue = value!;
                           VarForRegister.city = dropdownValue;
                         });
                       },
                       items: cities.map<DropdownMenuItem<String>>((String value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Padding(
                             padding: const EdgeInsets.only(left: 16),
                             child: Text(value),
                           ),
                         );
                       }).toList(),
                     ),
                 ),
                
            const SizedBox(
              height: 40,
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
                          builder: (context) => const FillForm3()));
                      },
                    ),
          ],
        ),
      ),
    );
  }
}
