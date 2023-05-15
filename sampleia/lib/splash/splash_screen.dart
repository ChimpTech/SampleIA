import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sampleia/home/home_page.dart';
import 'package:sampleia/login/login_page.dart';

import '../common/authentication_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _startAnimationController;
  late final AnimationController _endAnimationController;
  bool _showAnimation = true;
  AuthenticationManager authenticator = AuthenticationManager();

  @override
  void initState() {
    super.initState();
    _startAnimationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _showAnimation = false;
          });
        }
      });

    _endAnimationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          checkTheLoginStatus(context);
        }
      });
  }

  void checkTheLoginStatus(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    final isLoggedIn = await authenticator.hasValidCredentials();
    goToHomeScreen(isLoggedIn,context);
  }

  @override
  void dispose() {
    _startAnimationController.dispose();
    _endAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                if (_showAnimation)
                  Lottie.asset(
                    'assets/loading.json',
                    controller: _startAnimationController,
                    width: double.infinity,
                    onLoaded: (composition) {
                      _startAnimationController
                        ..duration = composition.duration
                        ..reset()
                        ..forward();
                    },
                  )
                else
                  Lottie.asset(
                    'assets/loading_finished.json',
                    controller: _endAnimationController,
                    width: double.infinity,
                    onLoaded: (composition) {
                      _endAnimationController
                        ..duration = composition.duration
                        ..reset()
                        ..forward();
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToHomeScreen(bool isLoggedIn, BuildContext context) {
    if (isLoggedIn) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
