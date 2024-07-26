import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child:  Column(
          children: [
            // SvgPicture.asset('assets/svgs/success.svg'),
            // SvgPicture.asset('assets/svgs/rute-icon.svg'),
          ],
        ),
      )),
    );
  }
}