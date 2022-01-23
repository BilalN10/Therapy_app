import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/EditPatientProfile/edit_patient_profile_page.dart';
import 'package:therapist/view/pages/PatientPages/PatientProfile/tabs/history_tab.dart';
import 'package:therapist/view/pages/PatientPages/PatientProfile/tabs/visit_tab.dart';
import 'package:therapist/view/widgets/mini_button.dart';
import 'package:therapist/view/widgets/profile_header.dart';
import 'package:therapist/view/widgets/tab_bar.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  List<String> tabsName = ['Visit', 'History'];
  List<Widget> tabsPage = const [
    VisitTab(),
    HistoryTab(),
    // ExaminationTab(),
    // TestTab(),
    // PrescriptionTab(),
  ];
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            ProfileHeader(
              name: "Michel Johnson",
              imgPath: "assets/images/c5.jpg",
              subtitle: "imicheljohnson@yahoo.com",
              widget: MiniButton(
                label: "Edit Profile",
                bgColor: kPrimaryColor,
                txtColor: Colors.white,
                onTap: () {
                  Get.to(
                    () => EditPatientProfilePage(),
                  );
                },
              ),
            ),
            MyTabBar(
              selectedTab: _selectedTab,
              tabs: tabsName,
              onItemPressed: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
            ),
            Expanded(
              child: tabsPage[_selectedTab],
            ),
          ],
        ),
      ),
    );
  }
}
