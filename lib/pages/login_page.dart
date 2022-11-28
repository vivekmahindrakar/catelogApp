import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome !",
                style: TextStyle(
                    fontFamily: GoogleFonts.raleway().fontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                      hintText: "Enter Username",
                      label: Text("Username"),
                    )),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          label: Text("Password"),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      child: Text(" Login "),
                      style: TextButton.styleFrom(minimumSize: Size(180, 45)),
                      onPressed: () =>
                          {Navigator.pushNamed(context, MyRoutes.HomePage)},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
