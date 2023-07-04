import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/organization_event_screens/organization_event_description.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OrganizationEventTimePage extends StatefulWidget {
  const OrganizationEventTimePage({super.key});

  @override
  State<OrganizationEventTimePage> createState() =>
      _OrganizationEventTimePageState();
}

  DateTime dateTime = DateTime.now();
  DateTime endDateTime = DateTime.now();
class _OrganizationEventTimePageState extends State<OrganizationEventTimePage> {
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final endHours = endDateTime.hour.toString().padLeft(2, '0');
    final endMinutes = endDateTime.minute.toString().padLeft(2, '0');
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.blueAppColor),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
            ],
          ),
          const ColumnSpacer(2),
          organizationTitleText(
              context, "Іс-шараның уақыты мен ұзақтығын көрсетіңіз"),
          const ColumnSpacer(1.5),
          const Text("Дата"),
          const ColumnSpacer(0.5),
          GestureDetector(
            onTap: () async {
              final date = await pickDate();
              if (date == null) return;

              var newDate = DateTime(date.year, date.month,
                  date.day, date.hour, date.minute);

              setState(() {
                dateTime = newDate;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(width: 1, color: Styles.greyLight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${dateTime.day}/${dateTime.month}/${dateTime.year}"),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
          const ColumnSpacer(1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Уақыты"),
                  const ColumnSpacer(0.5),
                  GestureDetector(
                    onTap: () async{
                      final time = await pickTime();
                      if(time==null)return;
                      final newDate = DateTime(dateTime.year,dateTime.month,dateTime.day,time.hour,time.minute);
                      setState(() {
                        dateTime = newDate;
                      });
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(width: 1, color: Styles.greyLight)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$hours:$minutes"),
                            const RowSpacer(3),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ұзақтығы"),
                  const ColumnSpacer(0.5),
                  GestureDetector(
                    onTap: () async{
                      final time = await pickEndTime();
                      if(time==null)return;
                      final newDate = DateTime(endDateTime.year,endDateTime.month,endDateTime.day,time.hour,time.minute);
                      setState(() {
                        endDateTime = newDate;
                      });
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(width: 1, color: Styles.greyLight)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$endHours:$endMinutes"),
                            const RowSpacer(3),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(context),
              GestureDetector(
            onTap: () {
            VarForAddEvents.eventDate = dateTime; 
            VarForAddEvents.startTime = dateTime; 
            VarForAddEvents.endTime = endDateTime;

            Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OrganizationEventDescriptionPage()));
            },
            child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Styles.blueAppColor,
            ),
            child:  Text("Келесі",style: TextStyle(color: Styles.white),),
          )
        ),
        ]),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale("ru","RU"),
      );
      
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
     
      );
  Future<TimeOfDay?> pickEndTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: endDateTime.hour, minute: endDateTime.minute),
     
      );
  /**Мы разработали приложение в фреймворке флаттер который поддерживает платформы ios и android. Написали на языке Dart.
    Перезапущу, начинается приложение со стартового страницы. Длится 3 секунды. потом идет знакомства с нашим приложением. 
    Можно пропустить, или можно дальше идти. Если есть аккаунта  можно логиниться если нет можно зарегистрироваться.
    Так, давайте регистрацию проходим.Напишем email, придумаем пароль. Здесь нужно указать персональные данные.Имя,
    дата рождение и пол. Нужно указать город и интересы. Пользователь зарегистрирован.Вы можете увидить в firebaseе. 
    Здесь у нас есть ивенты. Давайте создадим новый ивент.Первые нужно указать имя ивента. потом нужно указать интересы.
     потом нужно указать адресс.Дальше дату и время ивента.Дальше нужно написать описание и количество участников.Цена и формат.
     И нужно загрузить фото.И готово. Можно зайти и посмтреть об ивенте.
  */
}
