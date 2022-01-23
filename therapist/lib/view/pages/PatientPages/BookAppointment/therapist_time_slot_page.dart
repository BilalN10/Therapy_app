import 'dart:core';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:therapist/controller/subscription_contoller.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/model/models/days_model.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/header.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:therapist/view/widgets/mytherapist_tile.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class TherapistTimeSlot extends StatefulWidget {
  @override
  _TherapistTimeSlotState createState() => _TherapistTimeSlotState();
}

class _TherapistTimeSlotState extends State<TherapistTimeSlot> {
  final Therapist _therapist = therapistList[0];
  int selectedIndex = 0;
  String formatted;
  int _selectedIndex = -1;
  DateTime now = DateTime.now();
  TimeOfDay time;
  final no = DateTime.now();
  String selectedTime = " 12:00 pm";

  final DateFormat formatter = DateFormat('hh:mm a');
  SubscriptionController subscriptionController =
      Get.put(SubscriptionController());

  @override
  void initState() {
    super.initState();
    formatted = formatter.format(now);
    time = TimeOfDay.now();
  }

  DateTime applied(TimeOfDay time) {
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 1,
        backgroundColor: kAppBarBGColor,
        title: Text(
          "Time Slot",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 28,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Scrollbar(
          radius: const Radius.circular(kBorderRadius),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                  child: Header(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Therapist",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: kAppBarTitleSize,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: MyTherapistTile(
                    therapist: _therapist,
                    showRate: true,
                    showRating: true,
                  ),
                ),
                const SizedBox(height: 2 * kDefaultPadding),
                const Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                  child: const Text('Working Days'),
                ),
                const DaysCircle(),
                const SizedBox(height: 1 * kDefaultPadding),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                  child: Row(
                    children: const [
                      Text("Visiting Time:"),
                      SizedBox(width: .5 * kDefaultPadding),
                      Text("08:00 AM - 10:00 PM"),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    "Select Date: ${now.month}-${now.day}-${now.year}",
                  ),
                  trailing: const Icon(Icons.calendar_today_rounded),
                  onTap: () => _selectDate(context),
                ),
                ListTile(
                  title: Text(
                    "Select Time: " + selectedTime,
                  ),
                  trailing: const Icon(Icons.timer),
                  onTap: () {
                    _selectTime(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Date",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: kAppBarTitleSize,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: kPrimaryColor,
                    daysCount: 6,
                    onDateChange: (date) {
                      // New date selected
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available Slots",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: kAppBarTitleSize,
                              ),
                        ),
                        Text(
                          '12',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: timeSlotList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1 / 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: TimeSlot(
                        selected: _selectedIndex == index,
                        dateTime: timeSlotList[index],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                MyButton(
                  label: 'Book Appointment',
                  onTap: () {
                    //Get.back();
                    Get.defaultDialog(
                        title: "Book Appointment",
                        content: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Selected Date :",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding,
                                    ),
                                    Text(
                                      "Selected Time :",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding,
                                    ),
                                    Text(
                                      "Total Fee :",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding,
                                    ),
                                    Text(
                                      "%5 for booking :",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding + 4,
                                    ),
                                    Text(
                                      "Payment Type :",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${now.month}-${now.day}-${now.year}"),
                                    const SizedBox(
                                      height: kDefaultPadding - 2,
                                    ),
                                    Text("$selectedTime"),

                                    // Container(
                                    //   alignment: Alignment.topCenter,
                                    //   height: 40,
                                    //   width: 130,
                                    //   decoration: BoxDecoration(
                                    //       border: Border.all(
                                    //           color: Colors.blue, width: 2)),
                                    //   child: const TextField(
                                    //     maxLines: 2,
                                    //     keyboardType: TextInputType.number,
                                    //     style: TextStyle(fontSize: 16),

                                    //     //  controller: controller,
                                    //     // style: GoogleFonts.poppins(
                                    //     //     fontSize: size.height * 0.02, fontWeight: FontWeight.w600),
                                    //     decoration: InputDecoration(
                                    //       hintText: "50\$",
                                    //       contentPadding: EdgeInsets.symmetric(
                                    //           vertical: 10, horizontal: 4),
                                    //       border: InputBorder.none,
                                    //       counterText: '',
                                    //       //enabledBorder: InputBorder
                                    //     ),
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      height: kDefaultPadding - 2,
                                    ),
                                    const Text("50 \$"),
                                    const SizedBox(
                                      height: kDefaultPadding - 2,
                                    ),
                                    const Text("5 \$"),

                                    Obx(
                                      () => DropdownButton<String>(
                                        value: subscriptionController
                                            .dropdownValue.value,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        //  iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        // underline: Container(
                                        //   height: 2,
                                        //   color: Colors.deepPurpleAccent,
                                        // ),
                                        onChanged: (String newValue) {
                                          subscriptionController
                                              .dropdownValue.value = newValue;
                                        },
                                        items: <String>[
                                          'Paypal',
                                          'Bank Account',
                                          'Visa Card',
                                          "Amex Card",
                                          "Master Card",
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    // Container(
                                    //   alignment: Alignment.topCenter,
                                    //   height: 40,
                                    //   width: 130,
                                    //   decoration: BoxDecoration(
                                    //       border: Border.all(
                                    //           color: Colors.blue, width: 2)),
                                    //   child: const TextField(
                                    //     maxLines: 2,
                                    //     keyboardType: TextInputType.number,
                                    //     style: TextStyle(fontSize: 16),

                                    //     //  controller: controller,
                                    //     // style: GoogleFonts.poppins(
                                    //     //     fontSize: size.height * 0.02, fontWeight: FontWeight.w600),
                                    //     decoration: InputDecoration(
                                    //       hintText: "Enter Fee",
                                    //       contentPadding: EdgeInsets.symmetric(
                                    //           vertical: 10, horizontal: 4),
                                    //       border: InputBorder.none,
                                    //       counterText: '',
                                    //       //enabledBorder: InputBorder
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [

                                //     const SizedBox()
                                //   ],
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            MyButton(label: "Confirm", onTap: () {})
                          ],
                        ));
                    // CoolAlert.show(
                    //   context: context,
                    //   type: CoolAlertType.success,
                    //   text: 'Appointment is successfully booked.',
                    //   barrierDismissible: false,
                    //   // autoCloseDuration: const Duration(seconds: 1000),
                    // );
                  },
                ),
                const SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectTime(String dayName, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          height: 2 * kDefaultPadding,
          width: 4 * kDefaultPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index == selectedIndex ? kPrimaryColor : Colors.white,
            border: Border.all(
              color: kPrimaryColor,
            ),
          ),
          child: Center(
            child: Text(
              dayName,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color:
                        index == selectedIndex ? Colors.white : kPrimaryColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != now)
      setState(() {
        now = selected;
      });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (t != null)
      setState(() {
        final DateTime now = DateTime.now();
        time = t;
        time.format(context);
        debugPrint(time.toString());
        DateTime current;
        current =
            DateTime(now.year, now.month, now.day, time.hour, time.minute);
        selectedTime = DateFormat('hh:mm a').format(current);

        //debugPrint("my print is ${}");
      });
  }
}

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    Key key,
    @required this.dateTime,
    @required this.selected,
  }) : super(key: key);
  final DateTime dateTime;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: selected ? kPrimaryColor : Colors.white,
      ),
      child: Column(
        children: [
          Text(
            DateFormat.jm().format(dateTime),
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: selected ? Colors.white : Colors.black,
                ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.25),
            child: Text(
              'to',
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: selected ? Colors.white : Colors.black,
                  ),
            ),
          ),
          Text(
            DateFormat.jm().format(
              dateTime.add(
                const Duration(hours: 1),
              ),
            ),
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: selected ? Colors.white : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

class DaysCircle extends StatelessWidget {
  const DaysCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 3 * kDefaultPadding,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dayList.length,
        itemBuilder: (BuildContext context, int index) {
          final DaysModel day = dayList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            height: 1.5 * kDefaultPadding,
            width: 2 * kDefaultPadding,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isOdd ? kPrimaryColor : Colors.grey.shade300,
            ),
            child: Center(
              child: Text(
                day.dayName,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
