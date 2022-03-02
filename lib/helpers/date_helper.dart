import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

showMonthPicker(BuildContext context, List<int> yearArray, Function(int year, String month) onPicked) {
  Picker(
      adapter: PickerDataAdapter<String>(pickerdata: [
        yearArray,
        [
          'January',
          'February',
          'March',
          'April',
          'May',
          'June',
          'July',
          'August',
          'September',
          'October',
          'November',
          'December'
        ],
      ], isArray: true),
      hideHeader: false,
      title: new Text(""),
      onConfirm: (Picker picker, List value) {
        onPicked(yearArray[value[0]], 'January');
      }
  ).showModal(context);
}