import 'package:syncfusion_flutter_calendar/calendar.dart';

bool isPeriodAvailable(Appointment newAppointment, Appointment oldAppointment) {
  DateTime newStart = newAppointment.startTime;
  DateTime newEnd = newAppointment.endTime;
  DateTime oldStart = oldAppointment.startTime;
  DateTime oldEnd = oldAppointment.endTime;

  if (newStart.isBefore(oldStart) &&
      (newEnd.isBefore(oldStart) || newEnd.isAtSameMomentAs(oldStart))) {
    return true;
  } else if ((newStart.isAfter(oldEnd) || newStart.isAtSameMomentAs(oldEnd)) &&
      newEnd.isAfter(oldEnd)) {
    return true;
  } else {
    return false;
  }
}
