import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';

class AuthenticationManager {
  static final AuthenticationManager _singleton =
      AuthenticationManager._internal();

  static const String _clientId = Constants.AUTH0_CLIENT_ID;
  static const String _domain = Constants.AUTH0_DOMAIN;

  factory AuthenticationManager() {
    return _singleton;
  }

  AuthenticationManager._internal();

  Future<void> login() async {
    final Auth0 auth0 = Auth0(_domain, _clientId);
    try {
      await auth0.webAuthentication(scheme: "demo").login(
          audience: "https://chimptech-qa.auth0.com/api/v2/",
          scopes: const {
            'openid',
            'profile',
            'email',
            'offline_access',
            'read:current_user'
          });
    } catch (e) {
      if (kDebugMode) {
        print('Auth0 Login Error: $e');
      }
    }
  }

  Future<void> logout() async {
    final Auth0 auth0 = Auth0(_domain, _clientId);
    await auth0.webAuthentication(scheme: "demo").logout();
  }

  getCredentials() async {
    final Auth0 auth0 = Auth0(_domain, _clientId);
    final credentials = await auth0.credentialsManager.credentials();
    return credentials;
  }

  hasValidCredentials() async {
    final Auth0 auth0 = Auth0(_domain, _clientId);
    var isValidCredentials =
        await auth0.credentialsManager.hasValidCredentials();
    return isValidCredentials;
  }
}
