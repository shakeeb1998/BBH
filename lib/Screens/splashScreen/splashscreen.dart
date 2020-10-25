import 'package:test1/Models/config.dart';
import 'package:test1/Screens/HomeScreen/home_screen.dart';
import 'package:test1/Utils/local_storage_handler.dart';
import 'package:test1/Utils/remote_config.dart';
import 'package:test1/Utils/request_manager.dart';
import 'package:test1/Utils/signin_with_google.dart';
import 'package:test1/Screens/Attendance/Components/camera_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:test1/Utils/timetableMock.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {
  bool _isSignedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeApp().then((isInitialized) {
      FirebaseAuth.instance.onAuthStateChanged.first.then((FirebaseUser user) {
        // if (user != null) {
        //   Config.currentUser = user;
        //   print("signed in");
        //   //  print(user.email);
        //   _isSignedIn = true;


      });
    });
  }

  initializeApp() async {
    await StorageHandler.initialize();
    // await fetchRemoteConfig();

    var cameras = await availableCameras();
    Config.cameras=cameras;
//    await RequestManager().getClasses(email: "shakeebsiddiqui1998@gmail.com");
    await RequestManager().getCompleteTimetable();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SplashScreen.callback(
      name: 'assets/splashScreen.flr',
      onSuccess: (dynamic data) {
        _changeScreen();
      },
      onError: (dynamic error, dynamic stacktrace) {
        _changeScreen();
      },
      until: () => Future.delayed(Duration(seconds: 5)),
      startAnimation: '1',
    ));
  }

  void _changeScreen() {
    if (_isSignedIn) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => Container(
                child: Center(
                  child: RaisedButton(
                    onPressed: () async {
                      // FirebaseUser user = await signInWithGoogle();
                      // Config.currentUser = user;
                      // await Firebase.initializeApp();
                      print("dd");
                      print(MockTimeTable.emailKrinza);
                      RequestManager()
                          .getClasses(email: MockTimeTable.emailKrinza)
                          .then((value) {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      });
                    },
                    child: Text("Sign in with Google"),
                  ),
                ),
              )));
    }
  }
}
