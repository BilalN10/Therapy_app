import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therapist_bar.dart';

class VisitTherapistGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text('Visited Therapist',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        TherapistTile(
                          therapist: therapistList[0],
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
