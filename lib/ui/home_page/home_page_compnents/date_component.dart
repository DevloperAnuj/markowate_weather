import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DateComponent extends StatelessWidget {
  const DateComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDate(DateTime.now(),
          ["Date: ", dd, '-', mm, '-', yyyy, " Time:", hh, ":", nn]),
      style: TextStyle(
        color: Colors.indigoAccent.shade200,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}