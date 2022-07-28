import 'package:authentication_app/auth/providers/auth_cubit.dart';
import 'package:authentication_app/auth/utils/auth_validasi.dart';
import 'package:authentication_app/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController passwordConfirmeController =
      TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  bool _isChecked = false;
  bool _isVisible = false;
  bool _isVisibleConfirme = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.teal;
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a New Account',
              style: GoogleFonts.montserrat(
                fontSize: 28,
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
                "Create an account so you can started this application",
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

    Widget nameInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 35,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white60.withOpacity(0.9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z]+|\s"),
              )
            ],
            validator: (val) {
              if (!val!.isValidName) {
                return 'Nama tidak boleh kosong';
              } else {
                return null;
              }
            },
            controller: nameController,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0.5),
              border: InputBorder.none,
              hintText: 'masukan nama',
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
        ),
      );
    }

    Widget emailInput() {
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
            validator: (val) {
              if (!val!.isValidEmail) return 'email tidak boleh kosong';
              return null;
            },
            controller: emailController,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 2),
              border: InputBorder.none,
              hintText: 'masukan email',
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              icon: const Icon(
                Icons.email,
              ),
            ),
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
            controller: passwordController,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            obscureText: !_isVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'masukan password',
              contentPadding: const EdgeInsets.only(top: 14),
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              icon: const Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black45,
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

    Widget confirmedPasswordInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white60.withOpacity(0.9),
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
        child: Center(
          child: TextFormField(
            controller: passwordConfirmeController,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
            obscureText: !_isVisibleConfirme,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'konfirmasi password',
              contentPadding: const EdgeInsets.only(top: 14),
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
              icon: const Icon(
                Icons.lock,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisibleConfirme = !_isVisibleConfirme;
                  });
                },
                icon: _isVisibleConfirme
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black45,
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

    Widget checkBox() {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: 'I agree to the ',
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Terms of Service ',
                      style: GoogleFonts.montserrat(color: Colors.teal),
                    ),
                    const TextSpan(
                      text: 'and ',
                    ),
                    TextSpan(
                      text: '\nPrivacy Policy',
                      style: GoogleFonts.montserrat(color: Colors.teal),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget buttonSubmit() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          } else if (state is AuthFailed) {
            if (state.error ==
                '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    "Email ini sudah tidak tersedia",
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            } else if (state.error ==
                "[firebase_auth/unknown] Given String is empty or null") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    "Form tidak boleh di kosongkan",
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Container(
              height: 55,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.8),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }
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
              onPressed: () async {
                if (passwordConfirmeController.text !=
                    passwordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Password tidak cocok!",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                } else if (!_isChecked) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Mohon menyetujui persyaratan aplikasi!",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                } else {
                  _formKey.currentState!.validate();
                  if (nameController.text != '') {
                    context.read<AuthCubit>().signUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                }
              },
              child: Text(
                'Create Account',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      );
    }

    Widget signIpButton() {
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
                color: Colors.black54,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                " Sign In",
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    header(),
                    nameInput(),
                    emailInput(),
                    passwordInput(),
                    confirmedPasswordInput(),
                    checkBox(),
                  ],
                ),
                Column(
                  children: [
                    buttonSubmit(),
                    signIpButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
