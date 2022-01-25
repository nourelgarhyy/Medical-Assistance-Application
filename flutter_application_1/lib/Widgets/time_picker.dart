import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/contacts.dart';
import 'package:health_care_app/Providers/reminders_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'button_widget.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  TimePickerWidgetState createState() => TimePickerWidgetState();
}

class TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? time = null;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: textEditingController,
        onTap: () async {
          var newTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (newTime != null) {
            time = newTime;
            DateTime parsedTime =
                DateFormat.jm().parse(newTime.format(context).toString());
            String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
            setState(() => textEditingController.text = formattedTime);
          }
          String getTime() {
            return textEditingController.text;
          }
        },
      ),
    );
  }
}
