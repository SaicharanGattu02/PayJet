import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class SecurityCheckScreen extends StatefulWidget {
  @override
  _SecurityCheckScreenState createState() => _SecurityCheckScreenState();
}

class _SecurityCheckScreenState extends State<SecurityCheckScreen> {
  static const platform = MethodChannel('com.pixl.payjet/security');
  String securityStatus = "Checking security...";
  String deviceInfo = "";

  @override
  void initState() {
    super.initState();
    _performSecurityChecks();
  }

  Future<void> _performSecurityChecks() async {
    bool isUsbDebuggingEnabled = await _isUsbDebuggingEnabled();
    String deviceDetails = await _getDeviceInfo();

    setState(() {
      if (isUsbDebuggingEnabled) {
        securityStatus = "Environment Risk: USB debugging is enabled.";
      } else {
        securityStatus = "Environment Secure.";
      }
      deviceInfo = deviceDetails;
    });
  }

  Future<bool> _isUsbDebuggingEnabled() async {
    try {
      final bool result = await platform.invokeMethod('isUsbDebuggingEnabled');
      return result;
    } on PlatformException catch (e) {
      print("Failed to get USB debugging status: '${e.message}'.");
      return false;
    }
  }

  Future<String> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return """
    Device Info:
    Brand: ${androidInfo.brand}
    Model: ${androidInfo.model}
    Android Version: ${androidInfo.version.release}
    Physical Device: ${androidInfo.isPhysicalDevice}
    """;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security Check"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              securityStatus,
              style: TextStyle(fontSize: 20.0, color: Colors.red),
            ),
            SizedBox(height: 20),
            Text(
              deviceInfo,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
