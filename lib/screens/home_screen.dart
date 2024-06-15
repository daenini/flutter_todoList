import 'package:flutter/material.dart';
import 'package:my_app_project/util/values.dart';
import 'package:my_app_project/widgets/custom_button.dart';
import 'package:my_app_project/widgets/logo.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 200),
            Logo("TodoListApp", 150, 150),
            SizedBox(height: 50),
            CustomButton( title: '시작하기',
              textStyle: TextStyle( color: AppColors.white,
                fontWeight: FontWeight.w600,),
              onPressed: () => Navigator.pushNamed(context, "/login"),
            ),
          ],
        ),
      ),
    );



  }
}






