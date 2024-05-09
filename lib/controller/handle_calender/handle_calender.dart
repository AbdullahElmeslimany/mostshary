import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:android_intent_plus/android_intent.dart';

abstract class Calender {
  static addCalender(
      {required messges, required List startDate, required endDate}) async {
    final event = Event(
      title: 'Your Event Title',
      description: 'Your Event Description',
      location: 'Your Event Location',
      allDay: true,
      startDate: DateTime(int.parse(startDate[0]), int.parse(startDate[1]),
          int.parse(startDate[2])),
      endDate: DateTime(int.parse(endDate[0]), int.parse(endDate[1]),
          int.parse(endDate[2])), // Optional for iOS events
    );

    await Add2Calendar.addEvent2Cal(event);

    final intent = AndroidIntent(
      action: 'android.intent.action.INSERT', // Important
      data: 'content://com.android.calendar/events', // Important
      type: "vnd.android.cursor.item/event", // Important
      arguments: <String, dynamic>{
        'title': event
            .title, // Fixed: was "event.title" string, changed to event.title property
        'allDay': event.allDay, // Consistency: use event property
        'beginTime': event.startDate
            .millisecondsSinceEpoch, // Fixed: was event.date, changed to event.startDate
        'endTime': event.endDate
            .millisecondsSinceEpoch, // Adjusted to use startDate if endDate is null
        'description': event.description,
        'eventLocation': event
            .location, // Fixed: was event.locationDescription, changed to event.location
        'hasAlarm': 1,
        'calendar_id': 1,
        'eventTimezone': 'Europe/Berlin'
      },
    );

    intent.launchChooser("Choose an App to save the Date");
  }
}
