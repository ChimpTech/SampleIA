import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sampleia/common/storage/storage_item.dart';

import '../common/authentication_manager.dart';
import '../common/storage/storage_service.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthenticationManager authenticator = AuthenticationManager();
  String versionName = "V-1.0-B-1";
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 0.0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login_home_top.jpg'),
                          fit: BoxFit.fill)),
                )),
            SizedBox(
              height: 20,
              child: Container(color: Colors.white),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login_text_1.jpg'),
                          fit: BoxFit.none),
                      color: Colors.white),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login_text_2.jpg'),
                          fit: BoxFit.none),
                      color: Colors.white),
                )),
            Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 0.0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login_home_bottom.jpg'),
                          fit: BoxFit.fill)),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      _doLogOut();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF055CE5)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                    side: const BorderSide(
                                        color: Color(0xFF055CE5))))),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      _openUniversalLogin();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                    side: const BorderSide(
                                        color: Color(0xFF055CE5))))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF055CE5)),
                    )),
              ),
            ),
            if (versionName.isNotEmpty)
              Text(
                "Version: $versionName",
                style: const TextStyle(fontSize: 12),
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _openUniversalLogin() async {
    await authenticator.login();
    final tokenCredentials = await authenticator.getCredentials();
    if (tokenCredentials.accessToken.isNotEmpty) {
      _storageService.writeSecureData(
          StorageItem("access_token", tokenCredentials.accessToken));
      _storageService.writeSecureData(
          StorageItem("expired_at", tokenCredentials.expiresAt.toString()));

      _moveToHome();
      if (kDebugMode) {
        print('User email: ${tokenCredentials.user.email}');
        print('access token: ${tokenCredentials.accessToken}');
        print('refresh token: ${tokenCredentials.refreshToken}');
        print('id token: ${tokenCredentials.idToken}');
        print('expired At: ${tokenCredentials.expiresAt}');
        print('token type: ${tokenCredentials.tokenType}');
        print("Moving to home 2");
      }
    } else {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger
          .showSnackBar(const SnackBar(content: Text("Error in Login!")));
    }
  }

  _doLogOut() {
    authenticator.logout();
  }

  void _moveToHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
