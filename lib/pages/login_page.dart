import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
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
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(" Login "),
                    style: TextButton.styleFrom(),
                    onPressed: () => {
                      print("Hi Piyusha I love you the most"),
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
