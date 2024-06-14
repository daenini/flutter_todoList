import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplash(); // 앱이 시작될 때 특정 작업을 수행
  }

  _loadSplash() async {
    await Future.delayed(Duration(seconds: 5)); // 화면 5초간 대기
    Navigator.pushNamed(context, "/home"); // 메인 화면으로 이동
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 스플레시 화면 디자인을 구성할 수 있습니다.
      body: Center(
          child: SvgPicture.asset(
        "images/fc-logo.svg",
        height: 170,
        width: 170,
      )),
    );
  }
}










