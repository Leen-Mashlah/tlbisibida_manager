import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CasesWeeklyCalendar extends StatelessWidget {
  const CasesWeeklyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      firstDayOfWeek: 6,
      showWeekNumber: true,
      showNavigationArrow: true,
      dataSource: DataSource(getappointments()),
      
    );
  }
}

List<Appointment> getappointments() {
  List<Appointment> appointments = [
    Appointment(
      id: 1,
      subject: "Meeting",
      startTime: DateTime(2024, 11, 15, 10, 0),
      endTime: DateTime(2024, 11, 15, 11, 30),
      color: Colors.blue,
    ),
    Appointment(
      id: 2,
      subject: "Conference",
      startTime: DateTime(2024, 11, 15, 14, 0),
      endTime: DateTime(2024, 11, 15, 15, 30),
      color: Colors.red,
    ),
    Appointment(
        id: 3,
        subject: "Lunch",
        startTime: DateTime(2024, 11, 15, 14, 0),
        endTime: DateTime(2024, 11, 15, 15, 30)),
  ];
  return appointments;
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}
