import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

import 'package:orta/services/var_for_register.dart';
import '../../blocs/bloc/events_bloc.dart';
import '../../utils/utils.dart';
import '../bottom_bar.dart';

class OrganizationEventDescriptionPage extends StatefulWidget {
  const OrganizationEventDescriptionPage({super.key});

  @override
  State<OrganizationEventDescriptionPage> createState() =>
      _OrganizationEventDescriptionPageState();
}

TextEditingController _descriptionController = TextEditingController();
TextEditingController _countController = TextEditingController();
TextEditingController _costController = TextEditingController();
const List<String> formatList = [
  "Мастер Класс",
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
Uint8List? _image;

class _OrganizationEventDescriptionPageState
    extends State<OrganizationEventDescriptionPage> {
  // Uint8List? _file;

  bool isLoading = false;
  String uid = '';
  var userData = {};

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final User user = auth.currentUser!;
      uid = user.uid;

      var userSnap =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      userData = userSnap.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(
        e.toString(),
        context,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  String formatValue = formatList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Выйти",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => EventsBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  indicatorTab(Styles.greyLight),
                  const RowSpacer(1),
                  indicatorTab(Styles.greyLight),
                  const RowSpacer(1),
                  indicatorTab(Styles.greyLight),
                  const RowSpacer(1),
                  indicatorTab(Styles.greyLight),
                  const RowSpacer(1),
                  indicatorTab(Styles.greyDark),
                ],
              ),
              const ColumnSpacer(2),
              organizationTitleText(context, "Қосымша ақпарат"),
              const ColumnSpacer(2.5),
              Text(
                "Сипатттама",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ColumnSpacer(1),
              const Text("Іс-шаранызды сипаттайтын сипаттама жазыңыз"),
              const ColumnSpacer(2),
              SizedBox(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: "Кемінде 50 символ енгізіңіз",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              const ColumnSpacer(2.5),
              Text(
                "Қатысушылар саны",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ColumnSpacer(1),
              textFieldInputText(_countController, "Қатысушылар саны", null,
                  null, TextInputType.number),
              const ColumnSpacer(2.5),
              Text(
                "Бағасы",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ColumnSpacer(1),
              textFieldInputText(
                  _costController, "Бағасы", null, null, TextInputType.number),
              const ColumnSpacer(2.5),
              Text(
                "Формат",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ColumnSpacer(1),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Styles.greyColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: DropdownButton<String>(
                  value: formatValue,
                  underline: const SizedBox(),
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: Icon(Icons.arrow_downward),
                  ),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      formatValue = value!;
                      VarForRegister.city = formatValue;
                    });
                  },
                  items:
                      formatList.map<DropdownMenuItem<String>>((String value) {
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
              const ColumnSpacer(2.5),
              Text(
                "Фото",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const ColumnSpacer(1),
              const Text("Іс-шаранызды сипаттайтын сипаттама жазыңыз"),
              const ColumnSpacer(1),
              BlocConsumer<EventsBloc, EventsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      selectImage();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 85),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          color: Styles.greyDark,
                          image: _image != null
                              ? DecorationImage(
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                  image: MemoryImage(_image!))
                              : const DecorationImage(
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                  image: NetworkImage(
                                      'https://i.stack.imgur.com/l60Hf.png'),
                                )),
                      child: _image != null ? Icon(Icons.photo) : SizedBox(),
                    ),
                  );
                },
              ),
              const ColumnSpacer(2.5),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          backButton(context),
          BlocProvider(
            create: (context) => EventsBloc(),
            child: BlocConsumer<EventsBloc, EventsState>(
              listener: (context, state) {
                if (state is AddEventLoading) {
                  const CircularProgressIndicator();
                }
                if (state is AddEventFailed) {
                  showSnackBar(state.message, context);
                }
                if (state is AddEventSuccess) {
                  if (mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BottomBar(),
                      ),
                    );
                  }
                }
              },
              builder: (context, state) {
                return GestureDetector(
                    onTap: () {
                      getData();
                      context.read<EventsBloc>().add(
                            AddEvent(
                                uid: uid,
                                name: VarForAddEvents.name!,
                                description: _descriptionController.text,
                                eventDate: VarForAddEvents.eventDate!,
                                startTime: VarForAddEvents.startTime!,
                                endTime: VarForAddEvents.endTime!,
                                location: VarForAddEvents.location!,
                                interest: VarForAddEvents.interest!,
                                count: int.parse(_countController.text),
                                price: int.parse(_costController.text),
                                format: formatValue.toString(),
                                file: _image!),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: Styles.greyDark,
                      ),
                      child: const Text("Келесі"),
                    ));
              },
            ),
          ),
        ]),
      ),
    );
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }
}
