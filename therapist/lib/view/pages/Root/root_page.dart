import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapist/model/services/AuthService/auth_service.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/CommonPages/Notification/notification_page.dart';
import 'package:therapist/view/pages/CommonPages/Payment/my_cards_page.dart';
import 'package:therapist/view/pages/CommonPages/Settings/settings_page.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/choose_health_concern_page.dart';
import 'package:therapist/view/pages/PatientPages/Home/home_page.dart';
import 'package:therapist/view/pages/PatientPages/Messages/messages_page.dart';
import 'package:therapist/view/pages/PatientPages/MyAppointment/myappointments_page.dart';
import 'package:therapist/view/pages/PatientPages/MyTherapists/mytherapists_page.dart';
import 'package:therapist/view/pages/PatientPages/PatientProfile/patient_profile_page.dart';
import 'package:therapist/view/pages/Root/components/bottom_nav_bar.dart';
import 'package:therapist/view/pages/Root/components/drwawer_tile.dart';
import 'package:therapist/view/pages/ThPages/AddService/add_service_page.dart';
import 'package:therapist/view/pages/ThPages/My_Patient/my_patient_page.dart';
import 'package:therapist/view/pages/ThPages/ThHome/th_home_page.dart';
import 'package:therapist/view/pages/ThPages/ThProfile/th_profile_page.dart';
import 'package:therapist/view/pages/ThPages/ThSchedule/th_schedule_page.dart';
import 'package:therapist/view/pages/Welcome/welcome_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  final bool isTherapist;

  const RootPage({
    Key key,
    this.isTherapist = false,
  }) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  // ignore: unused_field
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _pages = [
      widget.isTherapist ? ThHomePage() : HomePage(),
      widget.isTherapist
          ? const ThProfilePage(
              editProfile: true,
            )
          : PatientProfilePage(),
      MessagesPage(),
      SettingsPage(),
    ];
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  int _selectedIndex = 0;
  List<Widget> _pages;

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void toggleDrawer() => _animationController.isCompleted ? close() : open();

  final double maxSlide = SizeConfig.screenWidth * 0.7;

  static double minDragStartEdge = 60;
  bool _canBeDragged = false;
  void _onDragStart(DragStartDetails details) {
    final bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    final bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxSlide - 16;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      final double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    const double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      final double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          final bool _absorbingPointer = _animationController.value > 0;
          final double slide = maxSlide * _animationController.value;
          final double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: [
              /// App Drawer Widget
              Scaffold(
                body: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  color: kPrimaryColor,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: getRelativeHeight(0.2),
                              width: SizeConfig.screenWidth * 0.65,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding),
                                child: Image.asset(
                                  'assets/images/hospital_2-removebg-preview.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 2,
                              bottom: 1,
                              child: widget.isTherapist
                                  ? Container(
                                      alignment: Alignment.bottomCenter,
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          shape: BoxShape.circle),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: SvgPicture.asset(
                                            'assets/images/dr_f.svg'),
                                      ),
                                    )
                                  : const CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          "assets/images/girl.png"),
                                      backgroundColor: Colors.transparent,
                                      radius: 50,
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Text(
                            "John Stathon",
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DrawerTile(
                          svgPath: 'assets/images/doctor.svg',
                          title: widget.isTherapist
                              ? "My Patients"
                              : "My Therapists",
                          onTap: () {
                            Get.to(
                              () => widget.isTherapist
                                  ? const MyPatientPage()
                                  : MyTherapistsPage(),
                            );
                          },
                        ),
                        DrawerTile(
                          svgPath: 'assets/images/schedule.svg',
                          title: "My Appointments",
                          onTap: () {
                            // print(widget.isTherapist);

                            Get.to(
                              () => MyAppointmentsPage(
                                isThrapist: widget.isTherapist,
                              ),
                            );
                          },
                        ),
                        if (widget.isTherapist)
                          DrawerTile(
                            svgPath: 'assets/images/schedule.svg',
                            title: "My Schedule",
                            onTap: () {
                              Get.to(
                                () => ThSchedulePage(),
                              );
                            },
                          ),
                        DrawerTile(
                          svgPath: 'assets/images/doctor.svg',
                          title: "My Payments",
                          onTap: () {
                            Get.to(
                              () => MyCardsPage(),
                            );
                          },
                        ),
                        DrawerTile(
                          svgPath: 'assets/images/logout.svg',
                          title: "Log Out",
                          onTap: () async {
                            //await _authService.signOut();
                            Get.offAll(() => WelcomePage());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// App Main Body Root
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      _animationController.value * kBorderRadius),
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 1.0,
                      backgroundColor: kAppBarBGColor,
                      leading: IconButton(
                        onPressed: toggle,
                        icon: Icon(
                          _absorbingPointer ? Icons.arrow_back_ios : Icons.menu,
                          color: kPrimaryColor,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: Colors.red),
                          Text(
                            "Centra Therapist",
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                      actions: [
                        IconButton(
                          onPressed: _selectedIndex == 2
                              ? () {}
                              : () {
                                  Get.to(
                                    () => NotificationPage(),
                                  );
                                },
                          icon: Icon(
                            _selectedIndex == 2
                                ? null
                                : Icons.notifications_outlined,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    body: SizedBox.expand(
                      child: AbsorbPointer(
                        absorbing: _absorbingPointer,
                        child: Stack(
                          children: [
                            _pages[_selectedIndex],
                            Positioned(
                              bottom: 0,
                              child: BottomNavigation(
                                onCenterTap: () {
                                  Get.to(
                                    () => widget.isTherapist
                                        ? AddServicePage()
                                        : const ChooseHealthConcernPage(),
                                  );
                                },
                                selectedIndex: _selectedIndex,
                                onItemPressed: (index) {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                centerIcon: Icons.add,
                                itemIcons: const [
                                  Icons.home,
                                  Icons.person,
                                  Icons.message,
                                  Icons.settings,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
