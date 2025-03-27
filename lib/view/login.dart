import 'package:aether/view/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;
  Widget eyeicon = Image.asset('assets/eye2.png');

  void toggleicon() {
    setState(() {
      visible = !visible;
      if (!visible) {
        eyeicon = Image.asset('assets/eye2.png');
      } else {
        eyeicon = Image.asset('assets/eye.png');
      }
    });
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isUsernameError = false;
  bool isPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/logo.png', height: 130)),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'AETHER',
                style: GoogleFonts.playfairDisplay(
                  color: const Color(0xFF5A6F52),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1.20,
                ),
              ),
            ),
            Text(
              'Login',
              style: GoogleFonts.playfairDisplay(
                color: Color(0xFF5A6F52),
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.50,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Get back to your account',
              style: GoogleFonts.playfairDisplay(
                color: Color(0xFF5A6F52),
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.90,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Username',
              style: GoogleFonts.lato(
                color: Color(0xFF5A6F52),
                fontSize: 19,
                fontWeight: FontWeight.w300,
                letterSpacing: -1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: namecontroller,
              onChanged: (value) {
                setState(() {
                  isUsernameError = false;
                });
              },
              cursorColor: Color(0xFF5A6F52),
              decoration: InputDecoration(
                hintText: ' Your name',
                hintStyle: GoogleFonts.lato(
                  color: Color(0xFF5A6F52),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.80,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 13), // Adjust padding here
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isUsernameError ? Colors.red : Color(0xFF5A6F52),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isUsernameError ? Colors.red : Color(0xFF5A6F52),
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
            SizedBox(
              height: 15,
            ),
            Text(
              'Password',
              style: GoogleFonts.lato(
                color: Color(0xFF5A6F52),
                fontSize: 19,
                fontWeight: FontWeight.w300,
                letterSpacing: -1,
              ),
            ),
            SizedBox(
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
              cursorColor: Color(0xFF5A6F52),
              decoration: InputDecoration(
                hintText: ' Your password',
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                      right: 1), // Adjust the padding as needed
                  child: GestureDetector(
                    onTap: toggleicon, // Call the toggleicon function on tap
                    child: eyeicon, // Dynamically update the icon
                  ),
                ),
                hintStyle: GoogleFonts.lato(
                  color: Color(0xFF5A6F52),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.80,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 13), // Adjust padding here
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isPasswordError ? Colors.red : Color(0xFF5A6F52),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isPasswordError ? Colors.red : Color(0xFF5A6F52),
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
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD57A3B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(361, 48), // Set width and height
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    setState(() {
                      isUsernameError = true;
                      isPasswordError = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid Username or Password'),
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
                'Sign In',
                style: TextStyle(
                  color: Color(0xFFF5E6D3),
                  fontSize: 20,
                  fontFamily: 'Lato',
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
