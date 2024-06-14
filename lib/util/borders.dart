part of values;

class Borders {

  static const BorderSide defaultPrimaryBorder =
  BorderSide(width: Sizes.WIDTH_0, style: BorderStyle.none);

  static const UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.whiteShade, width: Sizes.WIDTH_1,style: BorderStyle.solid
    ),
  );

  static const UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.whiteShade,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );
  static const UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.blackShade,
      width: Sizes.WIDTH_2,
      style: BorderStyle.solid,
    ),
  );
}








