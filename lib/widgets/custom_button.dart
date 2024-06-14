import 'package:flutter/material.dart';
import 'package:my_app_project/util/values.dart';
import 'package:my_app_project/widgets/spaces.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed; // 이벤트 콜백
  final double height; // 버튼 높이
  final double elevation; // 입체감
  final double borderRadius; // 모서리 굴림
  final String? title; // 버튼 라벨
  final Color color; // 버튼 컬러
  final BorderSide borderSide; // 버튼 높이
  final TextStyle? textStyle; // 텍스트 스타일
  final Widget? icon; // 아이콘 위젯
  final bool hasIcon; // 아이콘 보유 여부

  CustomButton({
    this.title,
    this.onPressed,
    this.height = Sizes.HEIGHT_50,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_24,
    this.color = AppColors.pink,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  }) : assert((hasIcon == true && icon != null) ||
            (hasIcon == false && icon == null));


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius), side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasIcon ? icon! : Container(), hasIcon ? SpaceW8() : Container(),
          title != null ? Text( title!,  style: textStyle, ) : Container(),
        ],
      ),
    );
  }
}

