import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'SettingMenu.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Progress.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  DateTime _focusDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Calander'),
        leading: Icon(Icons.logout),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            _calendarView(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, dd MMMM, yyyy').format(_selectedDay),
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ])),
    ));
  }

  Widget _calendarView() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      locale: 'en_US',
      startingDayOfWeek: StartingDayOfWeek.monday,
    );
  }
}
