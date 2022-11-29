import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final imgUrl =
      "https://media-exp1.licdn.com/dms/image/C4D03AQEMQAIekj_K9A/profile-displayphoto-shrink_200_200/0/1662895766822?e=1675296000&v=beta&t=taQZWr1fISewaejptU_yz1o1lQcCDNo5XY1m0claGBU";
  final accName = "Vivek Mahindrakar";
  final email = "vivekmahindrakar08@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 255, 255, 245),
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
                accountName: Text(accName),
                accountEmail: Text(email),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 255, 245)),
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                Fluttertoast.showToast(msg: "Profile button pressed");
              },
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Home button pressed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
              },
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              onTap: () {
                Fluttertoast.showToast(msg: "Address button pressed");
              },
              leading: Icon(
                CupertinoIcons.location,
                color: Colors.black,
              ),
              title: Text(
                "Address",
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
