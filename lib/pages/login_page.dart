import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool tapped = false;
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
                "Welcome ! $name",
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
                      ),
                      onChanged: (value) => {
                        name = value,
                        setState(() {}),
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          label: Text("Password"),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tapped = true;
                        });
                        //Navigator.pushNamed(context, MyRoutes.HomePage);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 45,
                        width: tapped ? 45 : 165,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(tapped ? 100 : 8),
                        ),
                        child: tapped
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                      ),
                    )
                    // ElevatedButton(
                    //   child: Text(" Login "),
                    //   style: TextButton.styleFrom(minimumSize: Size(180, 45)),
                    //   onPressed: () =>
                    //       {Navigator.pushNamed(context, MyRoutes.HomePage)},
                    // )
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
