import 'package:clockee/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clockee/stores/observable_alarm/observable_alarm.dart';

class EditAlarmTime extends StatelessWidget {
  final ObservableAlarm alarm;

  const EditAlarmTime({Key? key, required this.alarm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Observer(builder: (context) {
          final hours = alarm.hour.toString().padLeft(2, '0');
          final minutes = alarm.minute.toString().padLeft(2, '0');
          return Text(
            '$hours:$minutes',
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                color: CustomColors.sdPrimaryColor),
          );
        }),
        onTap: () async {
          final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: alarm.hour!, minute: alarm.minute!));
          if (time != null) {
            alarm.hour = time.hour;
            alarm.minute = time.minute;
          }
        },
      ),
    );
  }
}
