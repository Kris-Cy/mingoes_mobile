import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mingoes_mobile/Util/calendarUtils.dart';
import 'package:mingoes_mobile/Util/functions_and_info.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  //late final ValueNotifier<List<Event>> _selectedEvents;

  bool isCalendarLoaded = false;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    //_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    //_selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      //_selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      //_selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      //_selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      //_selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FunctionsAndInfo().getScreenHeight() * 0.595,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.calendarwiz.com/mobile.html?crd=univbah&nolognavbar=1',
        onPageFinished: (finish) {
          setState(() {
            isCalendarLoaded = true;
          });
        },
      ),
      // child: Column(
      //   children: [
      //     TableCalendar<Event>(
      //       firstDay: kFirstDay,
      //       lastDay: kLastDay,
      //       focusedDay: _focusedDay,
      //       selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      //       rangeStartDay: _rangeStart,
      //       rangeEndDay: _rangeEnd,
      //       calendarFormat: _calendarFormat,
      //       rangeSelectionMode: _rangeSelectionMode,
      //       //eventLoader: _getEventsForDay,
      //       startingDayOfWeek: StartingDayOfWeek.monday,
      //       calendarStyle: CalendarStyle(
      //         // Use `CalendarStyle` to customize the UI
      //         outsideDaysVisible: false,
      //         markerDecoration: BoxDecoration(
      //             color: Colors.white,
      //             border: Border.all(
      //               color: Colors.black
      //             ),
      //             shape: BoxShape.circle
      //         ),
      //         todayDecoration: BoxDecoration(color: Colors.blue[200], shape: BoxShape.circle),
      //         selectedDecoration: BoxDecoration(color: Colors.blue[600], shape: BoxShape.circle),
      //       ),
      //       onDaySelected: _onDaySelected,
      //       onRangeSelected: _onRangeSelected,
      //       onFormatChanged: (format) {
      //         if (_calendarFormat != format) {
      //           setState(() {
      //             _calendarFormat = format;
      //           });
      //         }
      //       },
      //       onPageChanged: (focusedDay) {
      //         _focusedDay = focusedDay;
      //       },
      //     ),
      //     const SizedBox(height: 12.0),
      //     // Expanded(
      //     //   child: ValueListenableBuilder<List<Event>>(
      //     //     valueListenable: _selectedEvents,
      //     //     builder: (context, value, _) {
      //     //       return ListView.builder(
      //     //         itemCount: value.length,
      //     //         itemBuilder: (context, index) {
      //     //           return Container(
      //     //             margin: const EdgeInsets.symmetric(
      //     //               horizontal: 12.0,
      //     //               vertical: 4.0,
      //     //             ),
      //     //             decoration: BoxDecoration(
      //     //               border: Border.all(),
      //     //               borderRadius: BorderRadius.circular(12.0),
      //     //               color: Colors.black,
      //     //             ),
      //     //             child: Container(
      //     //               height: 90,
      //     //               padding: EdgeInsets.all(0),
      //     //                   decoration: BoxDecoration(
      //     //                       image: DecorationImage(
      //     //                           image: AssetImage(
      //     //                               '${value[index].imgLink}',
      //     //                           ),
      //     //                           fit: BoxFit.cover,
      //     //                         colorFilter:
      //     //                         ColorFilter.mode(Colors.black.withOpacity(0.5),
      //     //                             BlendMode.dstATop),
      //     //                       ),
      //     //                     borderRadius: BorderRadius.circular(12)
      //     //                   ),
      //     //                   child: MaterialButton(
      //     //                     onPressed: () {
      //     //                       print("Event Link Pressed! ${value[index]}");
      //     //                     },
      //     //                     child: Column(
      //     //                       mainAxisAlignment: MainAxisAlignment.center,
      //     //                       children: [
      //     //                         Text('${value[index]}',
      //     //                           style: TextStyle(
      //     //                             color: Colors.white,
      //     //                             fontSize: 20,
      //     //                           ),
      //     //                         ),
      //     //                         Text('${value[index].desc}',
      //     //                           style: TextStyle(
      //     //                             color: Colors.white,
      //     //                             fontSize: 15,
      //     //                           ),
      //     //                         ),
      //     //                       ],
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //             );
      //     //         },
      //     //       );
      //     //     },
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }
}
