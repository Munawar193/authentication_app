import 'package:authentication_app/auth/providers/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttomLogOut() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.error,
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            );
          } else if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Container(
              height: 55,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
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
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              child: Text(
                'LogOut',
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Text(
                "Main Page",
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            buttomLogOut()
          ],
        ),
      ),
    );
  }
}
