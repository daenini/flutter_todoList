import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app_project/provider/MemberProvider.dart';
import 'package:my_app_project/util/values.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MemberProvider>(context);
    return Drawer(
      child: ListView( padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.pink,
            ),
            child: Center(
              child: Text('firstcoding app',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 32,
                  )),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () => Navigator.pushNamed(context, "/home"),
          ),

          memberProvider.nowLoginedMember == null
              ? ListTile(
                  title: const Text('로그인'),
                  onTap: () => Navigator.pushNamed(context, "/login"), // login
                )
              : ListTile(
                  title: const Text('로그아웃'),
                  onTap: () {
                    memberProvider.logout();
                    Navigator.pushNamed(context, "/home");
                  }, // login
                ),

          ListTile(
            title: const Text('Todo List'),
            onTap: () {
              if (memberProvider.nowLoginedMember == null) {
                Navigator.pushNamed(context, "/login");
              } else {
                Navigator.pushNamed(context, "/todo");
              }
            }, // todo
          ),
          ListTile(
            title: const Text('날씨'),
            onTap: () {
              if (memberProvider.nowLoginedMember == null) {
                Navigator.pushNamed(context, "/login");
              } else {
                Navigator.pushNamed(context, "/wether");
              }
            }, // todo
          )


        ],
      ),
    );
  }
}




