import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:my_app_project/domain/Member.dart';
import 'package:my_app_project/provider/MemberProvider.dart';
import 'package:my_app_project/util/values.dart';
import 'package:my_app_project/widgets/customDrawer.dart';
import 'package:my_app_project/widgets/custom_button.dart';
import 'package:my_app_project/widgets/custom_text_form_field.dart';
import 'package:my_app_project/widgets/spaces.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pink,
        elevation: Sizes.ELEVATION_0,
        title: Text('회원가입'),
      ),
      endDrawer: CustomDrawer(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_36),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  _buildIntroText(context),
                  SpaceH20(),
                  _buildForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroText(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ListBody(
      children: <Widget>[
        Text(
          StringConst.SIGN_UP,
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.blackShade,
            fontWeight: FontWeight.w900,
          ),
        ),
        SpaceH20(),
        Text(
          StringConst.SIGN_UP_MSG,
          style: textTheme.titleSmall?.copyWith(
            color: AppColors.blackShade,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    final TextEditingController email_controller = TextEditingController();
    final TextEditingController nickname_controller = TextEditingController();
    final TextEditingController pw_controller = TextEditingController();
    final memberProvider = Provider.of<MemberProvider>(context);

    return Column(
      children: <Widget>[
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.HINT_NAME,
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
          prefixIcon: Icon(
            FeatherIcons.user,
            color: AppColors.blackShade,
            size: Sizes.ICON_SIZE_20,
          ),
          controller: nickname_controller,
        ),
        SpaceH20(),
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.emailAddress,
          hintText: StringConst.HINT_EMAIL_ADDRESS,
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
          prefixIcon: Icon(
            FeatherIcons.mail,
            color: AppColors.blackShade,
            size: Sizes.ICON_SIZE_20,
          ),
          controller: email_controller,
        ),
        SpaceH20(),
        CustomTextFormField(
          hasPrefixIcon: true,
          textInputType: TextInputType.text,
          hintText: StringConst.HINT_PASSWORD,
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
          obscured: true,
          prefixIcon: Icon(
            FeatherIcons.key,
            color: AppColors.blackShade,
            size: Sizes.ICON_SIZE_20,
          ),
          controller: pw_controller,
        ),
        SpaceH20(),
        CustomButton(
            title: StringConst.SIGN_ME_UP,
            textStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            onPressed: () {
              memberProvider.memberInsert(Member(nickname_controller.text,
                  email_controller.text, pw_controller.text));

              Navigator.pushNamed(context, "/login");
            }),
        SpaceH20(),
        InkWell(
          onTap: () => Navigator.pushNamed(context, "/login"),
          child: Text(
            StringConst.ALREADY_HAVE_AN_ACCOUNT,
            style: textTheme.titleSmall?.copyWith(
              fontSize: Sizes.TEXT_SIZE_14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
