import 'package:aether/main.dart';
import 'package:aether/model/transitions.dart';
import 'package:aether/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;
  Icon obscureIcon = Icon(
    Icons.visibility_off,
    color: primaryColor.withValues(alpha: 0.5),
  );
  Icon visibleIcon = Icon(
    Icons.visibility,
    color: primaryColor.withValues(alpha: 0.5),
  );

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isUsernameError = false;
  bool isPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/logo.png', height: 130)),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'AETHER',
                style: GoogleFonts.playfairDisplay(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1.20,
                ),
              ),
            ),
            Text(
              'Login',
              style: GoogleFonts.playfairDisplay(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.50,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Get back to your account',
              style: GoogleFonts.playfairDisplay(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.90,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Username',
              style: GoogleFonts.lato(
                color: primaryColor,
                fontSize: 19,
                fontWeight: FontWeight.w300,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: namecontroller,
              onChanged: (value) {
                setState(() {
                  isUsernameError = false;
                });
              },
              cursorColor: primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 13), // Adjust padding here
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isUsernameError ? Colors.red : primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isUsernameError ? Colors.red : primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            isUsernameError && namecontroller.text.isEmpty
                ? Text('Username cannot be empty',
                    style: GoogleFonts.lato(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -1,
                    ))
                : Container(),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Password',
              style: GoogleFonts.lato(
                color: primaryColor,
                fontSize: 19,
                fontWeight: FontWeight.w300,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: passwordcontroller,
              onChanged: (value) {
                setState(() {
                  isPasswordError = false;
                });
              },
              obscureText: !visible,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      visible = !visible;
                    }),
                    child: !visible ? visibleIcon : obscureIcon,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isPasswordError ? Colors.red : primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isPasswordError ? Colors.red : primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            isPasswordError && passwordcontroller.text.isEmpty
                ? Text(
                    'Password cannot be empty',
                    style: GoogleFonts.lato(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -1,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(361, 48), // Set width and height
              ),
              onPressed: () {
                if (namecontroller.text.isEmpty) {
                  setState(() {
                    isUsernameError = true;
                  });
                  if (passwordcontroller.text.isEmpty) {
                    setState(() {
                      isPasswordError = true;
                    });
                  }
                } else if (passwordcontroller.text.isEmpty) {
                  setState(() {
                    isPasswordError = true;
                  });
                } else {
                  if (namecontroller.text == 'admin' &&
                      passwordcontroller.text == 'admin@123') {
                    Navigator.pushAndRemoveUntil(context,
                        FadeRoute(page: const HomePage()), (route) => false);
                  } else {
                    setState(() {
                      isUsernameError = true;
                      isPasswordError = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Invalid Username or Password',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor:
                              Colors.red, // Optional: Add a background color
                          behavior: SnackBarBehavior
                              .floating, // Optional: Floating behavior
                        ),
                      );
                    });
                  }
                }
              },
              child: Text(
                'Log In',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
