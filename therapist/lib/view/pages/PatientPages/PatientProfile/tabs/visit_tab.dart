import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/widgets/appointment_tile.dart';

class VisitTab extends StatelessWidget {
  const VisitTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: appointmentList.length + 1,
        itemBuilder: (context, index) {
          return index < appointmentList.length
              ? Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding * 0.75),
                  child: AppointmentTile(
                    isTh: false,
                    showChat: false,
                    appointment: appointmentList[index],
                    topButton: const Text(''),
                  ),
                )
              : const SizedBox(
                  height: kDefaultPadding * 8,
                );
        },
      ),
    );
  }
}
