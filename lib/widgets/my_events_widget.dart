import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';

class MyEventsWidget extends StatelessWidget {
  const MyEventsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            color: Styles.greyDark,
          ),
        ),
        const RowSpacer(2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("11 март, 19:00 - 21:00"),
            const ColumnSpacer(1),
            Text(
              "UX/UI design",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const ColumnSpacer(0.5),
            const Text("Мастер класс"),
            const ColumnSpacer(1.5),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Styles.greyDark),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.description,
                      size: 10,
                    ),
                    const RowSpacer(0.5),
                    Text(
                      "Дизайн",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
            Text("Free"),
            ColumnSpacer(7.5),
            Text("25 из 34"),
          ],
        )
      ],
    );
  }
}
