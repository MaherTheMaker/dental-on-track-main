import 'package:dental_on_track/components/custom_button.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:dental_on_track/modules/book_appointment/patinet_appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../components/circled_profile_pic.dart';
import '../../components/custom_input_field.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';

class BookAppointment extends StatelessWidget {
  final PatientAppointmentsController _controller=Get.put(PatientAppointmentsController(),tag: "PatientAppointmentsController");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx((){
        if(_controller.loading.value){
          return const Center(child: CircularProgressIndicator(),);
        }else{
          return SafeArea(
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.5,
                      child: Center(
                          child:SfCalendar(
                            view: CalendarView.timelineWeek,
                            allowAppointmentResize: true,
                            showDatePickerButton: true,
                            showCurrentTimeIndicator: true,

                            // timeSlotViewSettings:
                            // TimeSlotViewSettings(
                            //
                            //     timeInterval: Duration(minutes: 30)),
                            minDate: DateTime.now(),
                            dataSource: MeetingDataSource(_getDataSource()),
                            // by default the month appointment display mode set as Indicator, we can
                            // change the display mode as appointment using the appointment display
                            // mode property
                            monthViewSettings: const MonthViewSettings(
                                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                                showTrailingAndLeadingDates: true
                            ),
                            onTap: (CalendarTapDetails cal){

                              _controller.date=cal.date!;
                            },
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Center(
                      child: CustomInputField(
                        width: MediaQuery.of(context).size.width * .85,
                        height: getProportionateScreenHeight(56),
                        onChanged: (val) {
                          _controller.notes=val;
                        },
                        hintText: "Notes",
                        hintStyle: TextStyle(
                            color: buttonColor.withOpacity(.5),
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansMedium"
                        ),
                        textStyle: TextStyle(
                            color: buttonColor,
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansSemiBold"
                        ),

                      ),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(120),
                    ),
                    Center(
                      child: CustomButton(
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color:Colors.white,
                            fontFamily: "OpenSansBold",
                          ),
                          width: MediaQuery.of(context).size.width*.8,
                          height: getProportionateScreenHeight(56),
                          color: buttonColor,
                          onTap: () async{
                            if(_controller.date==null){
                              EasyLoading.showError("Please select date");
                            }else{
                              await _controller.bookAppointment(_controller.date, _controller.date.hour*60, (_controller.date.hour+1)*60);
                              if(_controller.booked.value){
                                EasyLoading.showSuccess("Booked SuccessFully");
                                Get.delete<PatientAppointmentsController>();
                                Navigator.pop(context);
                              }else{
                                EasyLoading.showError("Error,Try again");
                              }
                            }
                          },
                          text: "Book Now"),
                    ),
                  ],
                ),
                Positioned(
                    top: 0.0,
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-.8, 0),
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenWidth(50),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3.0,
                                          offset: Offset(0,1),
                                          spreadRadius: 1.0
                                      ),
                                    ]
                                ),
                                child: const Center(
                                  child: FaIcon(FontAwesomeIcons.list,color:buttonColor),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(.8, 0),
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                  width: getProportionateScreenWidth(50),
                                  height: getProportionateScreenWidth(50),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5.0,
                                            offset: Offset(0,3),
                                            spreadRadius: 3.0
                                        ),
                                      ]
                                  ),
                                  child: ProfilePic(
                                      color: Colors.transparent,
                                      width: getProportionateScreenWidth(50), height: getProportionateScreenWidth(50))
                              ),
                            ),
                          ),
                          Center(
                            child: Logo(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        }
      }),
    );
  }
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    for(var appointment in _controller.patientsAppointments){
      final DateTime? date=appointment.date;
      final DateTime startTime = DateTime(date!.year, date.month, date.day, appointment.startTime!~/60);
      final DateTime endTime = DateTime(date.year, date.month, date.day, appointment.endTime!~/60);
      meetings.add(Meeting(appointment.patientName!,startTime,endTime,Colors.green,false));
    }
    print(meetings.length);
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}