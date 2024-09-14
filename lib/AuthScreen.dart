// lib/auth_screen.dart
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authStatus = "Not Authenticated";

  Future<void> authenticate() async {
    try {
      // Check if biometrics or device credentials can be used
      bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

      if (canAuthenticate) {
        bool isAuthenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to proceed',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: false, // Allows fallback to PIN, pattern, or password
          ),
        );

        setState(() {
          _authStatus = isAuthenticated ? "Authenticated" : "Authentication Failed";
        });
      } else {
        setState(() {
          _authStatus = "Device does not support authentication";
        });
      }
    } catch (e) {
      setState(() {
        _authStatus = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Auth Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _authStatus,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: authenticate,
              child: Text("Authenticate"),
            ),
          ],
        ),
      ),
    );
  }
}
