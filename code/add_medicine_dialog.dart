import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddMedicineDialog extends StatefulWidget {
  AddMedicineDialog({Key? key}) : super(key: key);

  @override
  AddMedicineState createState() => AddMedicineState();
}

class AddMedicineState extends State<AddMedicineDialog> {
  GlobalKey<FormState> oFormKey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: oFormKey,
        child: Column(
          children: <Widget>[
            DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'd MMM, yyyy',
              controller: controller1,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event),
              dateLabelText: 'Start Date',
              timeLabelText: 'Dosage Timing',
              onChanged: (val) => setState(() => _valueChanged1 = val),
              validator: (val) {
                setState(() => _valueToValidate1 = val ?? '');
                return null;
              },
              onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
            )
          ],
        ),
      ),
    );
  }
}
