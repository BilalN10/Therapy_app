import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/ThPages/ThHome/components/service_bar.dart';

class ServicesDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Services',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                itemCount: serviceList.length + 1,
                itemBuilder: (BuildContext context, int index) =>
                    index < serviceList.length
                        ? ServiceTile(
                            service: serviceList[index],
                          )
                        : const SizedBox(height: kDefaultPadding * 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
