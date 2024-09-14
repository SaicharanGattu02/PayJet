import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:payjet/HomeScreen.dart';
import 'package:payjet/screens/Dashboard.dart';
import 'package:payjet/screens/MainHome.dart';

import '../AuthScreen.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String token="";
  String status="";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    // Navigate to the next screen after the animation
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Dashboard()));
      });
    });

  }


  // Fetchdetails() async {
  //   var Token = (await PreferenceService().getString('token'))??"";
  //   setState(() {
  //     token=Token;
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff51BD88),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Image.asset(
                "assets/logo.png",
                width: 260,
                height: 150,
                fit:BoxFit.contain,
              ),
            ),
          ),
          // SizedBox(height: screenheight*0.2),
          // Image.asset(
          //   "assets/splashimg1.png",
          //   width: 80,
          //   height: 80,
          //   fit:BoxFit.contain,
          // ),
          // SizedBox(height: 10,),
          // Container(
          //   width:screenwidth*0.3 ,
          //   child: Text("100% SECURE PAYMENTS",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontFamily: "Inter",
          //       fontSize:15,
          //       fontWeight: FontWeight.w700
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
