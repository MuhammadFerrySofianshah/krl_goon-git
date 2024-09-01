import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/widgets/widget.dart';

import '../../../colors.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({Key? key}) : super(key: key);

  @override
  State<BantuanPage> createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Bantuan',
          style: GoogleFonts.poppins(
            color: grayColor,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                'Hello, \nhow can we help ?',
                blackColor,
                18,
                FontWeight.w600,
              ),
              sizedBoxHeightWidget(10),
              textWidget(
                'Find answers and inspiration for everything about us',
                blackColor,
                16,
                FontWeight.normal,
              ),
              sizedBoxHeightWidget(15),
              _boxInput(),
            ],
          ),
        ),
      ),
    );
  }

  Column _boxInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hoverColor: const Color(0xffD9D9D9),
                  filled: true,
                  fillColor: const Color(0xffD9D9D9),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Color(0xff979797),
                    size: 25.0,
                  ),
                  hintText: 'Search your question...',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xff979797),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
