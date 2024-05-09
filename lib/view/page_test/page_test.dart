import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';

class PageTest extends StatelessWidget {
  const PageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              // addCalender(messges: "", startDate: "", endDate: "");
            },
            child: Text("data")),
      ),
    );
  }
}
