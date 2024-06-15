import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:my_app_project/provider/MemberProvider.dart';
import 'package:my_app_project/util/values.dart';
import 'package:my_app_project/widgets/customDrawer.dart';
import 'package:my_app_project/widgets/custom_button.dart';
import 'package:my_app_project/widgets/custom_text_form_field.dart';
import 'package:my_app_project/widgets/spaces.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_0,
        backgroundColor: AppColors.blue,
        title: Text('로그인'),
      ),
      endDrawer: CustomDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_36),
        child: ListView(
          children: <Widget>[
            //10% of the height of screen
            SizedBox(height: 50),
            _buildIntroText(context),
            SpaceH8(),
            _buildForm(context),
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
          StringConst.WELCOME,
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.blackShade,
          ),
        ),
        SpaceH80(),
        Text(
          StringConst.SIGN_IN,
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.blackShade,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;

    final TextEditingController email_controller = TextEditingController();
    final TextEditingController pw_controller = TextEditingController();

    final memberProvider = Provider.of<MemberProvider>(context);

    return Column(
      children: <Widget>[
        CustomTextFormField(hasPrefixIcon: true, textInputType: TextInputType.emailAddress,
                            hintText: StringConst.HINT_EMAIL_ADDRESS,
                            hintTextStyle: Styles.customTextStyle(color: AppColors.blackShade),
                            textStyle: Styles.customTextStyle(color: AppColors.blackShade),
          prefixIcon: Icon(
            FeatherIcons.mail,
            color: iconTheme.color,
            size: Sizes.ICON_SIZE_20,
          ),
          controller: email_controller,
        ),
        SpaceH20(),
        CustomTextFormField(hasPrefixIcon: true, textInputType: TextInputType.text,
                            hintTextStyle: Styles.customTextStyle(color: AppColors.blackShade),
                            textStyle: Styles.customTextStyle(color: AppColors.blackShade),
                            hintText: StringConst.HINT_PASSWORD,
                            obscured: true,
          prefixIcon: Icon(
            FeatherIcons.key,
            color: iconTheme.color,
            size: Sizes.ICON_SIZE_20,
          ),
          controller: pw_controller,
        ),
        SpaceH20(),


        CustomButton(title: StringConst.SIGN_ME_IN, textStyle:
                     textTheme.bodyLarge?.copyWith( color: AppColors.white,
                                                    fontWeight: FontWeight.w600, ),
          onPressed: () {
            if (
            memberProvider.login(email_controller.text, pw_controller.text))
            {
              Navigator.pushNamed(context, "/todo");
            } else {
              confirmDialog(context);
            }
          },
        ),



        SpaceH20(),
        InkWell(
          onTap: () => Navigator.pushNamed(context, "/signup"),
          child: Text(
            StringConst.DONT_HAVE_AN_ACCOUNT,
            textAlign: TextAlign.center,
            style: textTheme.titleSmall?.copyWith(
              fontSize: Sizes.TEXT_SIZE_14,
              color: AppColors.blackShade,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void confirmDialog(context) {
    showDialog( context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpaceH8(),
              const Text("아이디 또는 비밀번호를 확인하세요!"),
              IconButton( icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      },
    );
  }










}
