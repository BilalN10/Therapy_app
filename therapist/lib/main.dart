import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/model/services/DatabaseService/local_db_service.dart';
import 'package:therapist/view/pages/PatientPages/Home/home_page.dart';
import 'package:therapist/view/pages/Splash/splash_page.dart';
import 'package:therapist/view/scroll.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Therapist",
            theme: ThemeData(fontFamily: 'Montserrat'),
            home: //MYScrollScreen(),
                Root(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Root extends StatelessWidget {
  // ignore: unused_field
  final LocalDBService _localDBService = LocalDBService();

  // ignore: unused_field
  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // bool _isTherapist = _localDBService.isTherapistLogedIn();
    // bool _isLoggedIn = _localDBService.isLoggedIn();

    // print('User Signed In: ' + _isLoggedIn.toString());
    // print('Istherapist: ' + _isTherapist.toString());

    SizeConfig.initSize(context);
    return SplashPage();
    // NotificationPage();

    // const RootPage(
    //   isTherapist: true,
    // );
    // return _isLoggedIn
    //     ? RootPage(
    //         isTherapist: _isTherapist,
    //       )
    //     : WelcomePage();
  }
}
