import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/widgets/widget.dart';

import '../../../colors.dart';

class IsiSaldoPage extends StatefulWidget {
  const IsiSaldoPage({Key? key}) : super(key: key);

  @override
  State<IsiSaldoPage> createState() => _IsiSaldoPageState();
}

class _IsiSaldoPageState extends State<IsiSaldoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: wText(
          'Isi saldo',
          blackColor,
          18,
          FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wText('Mau isi saldo kamu dengan cara apa ?', blackColor, 16,
                  FontWeight.normal),
              wSizedBoxHeight(8),
              wText('Transfer Bank', Colors.black38, 14, FontWeight.normal),
              wSizedBoxHeight(8),
              _BoxBCA(),
              wSizedBoxHeight(10),
              _BoxBRI(),
              wSizedBoxHeight(10),
              _BoxMandiri(),
            ],
          ),
        ),
      ),
    );
  }

  _BoxBCA() {
    return Container(
              height: 60,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/bca.png'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 16,),
                    )
                  ],
                ),
              ),
            );
  }
  _BoxBRI() {
    return Container(
              height: 60,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/bri.png'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 16,),
                    )
                  ],
                ),
              ),
            );
  }
  _BoxMandiri() {
    return Container(
              height: 60,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/mandiri.png'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 16,),
                    )
                  ],
                ),
              ),
            );
  }
}
