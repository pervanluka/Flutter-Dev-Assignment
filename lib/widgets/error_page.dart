import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ErrorDataPage extends StatelessWidget {
  final String errorMsg;
  const ErrorDataPage({this.errorMsg = 'Lost connection!', super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/anim/98642-error-404.json',
                width: 200, repeat: true),
            Text(
              errorMsg,
              style: GoogleFonts.lato(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  final String errorMsg;
  const ErrorPage({this.errorMsg = 'No data!', super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/anim/98642-error-404.json',
                width: 200, repeat: true),
            Text(
              errorMsg,
              style: GoogleFonts.lato(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
