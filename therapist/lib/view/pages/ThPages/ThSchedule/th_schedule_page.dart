import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/widgets/my_button.dart';
import '../../../size_config.dart';

class ThSchedulePage extends StatefulWidget {
  @override
  _ThSchedulePageState createState() => _ThSchedulePageState();
}

class _ThSchedulePageState extends State<ThSchedulePage> {
  Map<String, bool> _weeklySchedule = {
    'Monday': true,
    'Tuesday': true,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };
  bool value = false;
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
          "My Schedule",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Set same time for all weeks',
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(
                        height: 20,
                        child: Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            activeColor: kPrimaryColor,
                            value: value,
                            onChanged: (v) {
                              setState(() {
                                this.value = v;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    itemCount: _weeklySchedule.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final String key = _weeklySchedule.keys.elementAt(index);
                      return ScheduleTile(
                        value: _weeklySchedule[key],
                        day: key,
                        onChanged: (v) {
                          setState(() {
                            _weeklySchedule[key] = !_weeklySchedule[key];
                          });
                        },
                      );
                    }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                  child: MyButton(
                    label: 'Update Schedule',
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScheduleTile extends StatefulWidget {
  const ScheduleTile({
    Key key,
    @required this.day,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  final String day;
  final bool value;
  final Function onChanged;

  @override
  _ScheduleTileState createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {
  String _startTime = "8:30 AM";
  String _endTime = "9:30 AM";

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding * 0.75,
            ),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: Colors.white,
                boxShadow: [
                  widget.value
                      ? BoxShadow(
                          color: Colors.grey[300],
                          offset: const Offset(0, 3),
                          blurRadius: 15,
                        )
                      : const BoxShadow(
                          color: Colors.transparent,
                        ),
                ]),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.day,
                      style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(
                    height: 20,
                    child: Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        activeColor: kPrimaryColor,
                        value: widget.value,
                        onChanged: widget.onChanged,
                      ),
                    ),
                  ),
                ]),
          ),
          widget.value
              ? Container(
                  margin: const EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: kDefaultPadding * 0.75,
                  ),
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start Time: ' + _startTime,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: kDefaultPadding,
                                top: kDefaultPadding * 0.5,
                              ),
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.schedule,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  _getTimeFromUser(isStartTime: true);
                                },
                              ),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'End Time: ' + _endTime,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: kDefaultPadding,
                                top: kDefaultPadding * 0.5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _getTimeFromUser(isStartTime: false);
                                },
                                child: const Icon(
                                  Icons.schedule,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  _getTimeFromUser({@required bool isStartTime}) async {
    final _pickedTime = await _showTimePicker();
    // print(_pickedTime.format(context));
    final String _formatedTime = _pickedTime.format(context);
    //  print(_formatedTime);
    if (_pickedTime == null)
      // ignore: avoid_print
      print("time canceld");
    else if (isStartTime)
      setState(() {
        _startTime = _formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
      //_compareTime();
    }
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime: const TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }
}
