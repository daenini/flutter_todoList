import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {

  final String title;
  final double width;
  final double height;

  const Logo([this.title='', this.width=100, this.height=100]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "images/SJCU.svg",
          height: height, width: width,),
        SizedBox(height: 20,), // 간격처리
        Text(
          title, style: TextStyle(fontSize:32, fontWeight: FontWeight.bold),
        ),
      ],
    );

  }
}



