import 'package:authentication_app/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.teal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "I am so happy to see. You can continue to login for this application",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 35,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white60.withOpacity(0.9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextFormField(
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 1),
            border: InputBorder.none,
            hintText: 'masukan password',
            hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            icon: const Icon(Icons.email),
          ),
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white60.withOpacity(0.9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: TextFormField(
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            obscureText: !_isVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'masukan password',
              contentPadding: const EdgeInsets.only(top: 15),
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              icon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black54,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.teal,
                      ),
              ),
            ),
          ),
        ),
      );
    }

    Widget forgotPassword() {
      return Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Forgot password',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonSubmit() {
      return Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            shadowColor: Colors.white,
          ),
          onPressed: () {},
          child: Text(
            'Login',
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      );
    }

    Widget signUpButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Don't have an account? ",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                " Sign Up",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header(),
                  emailInput(),
                  passwordInput(),
                  forgotPassword(),
                ],
              ),
              Column(
                children: [
                  buttonSubmit(),
                  signUpButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
