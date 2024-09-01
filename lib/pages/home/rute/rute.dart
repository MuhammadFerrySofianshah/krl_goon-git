import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krl_goon/pages/home/rute/list_suggestions_model.dart';
import 'package:krl_goon/pages/home/tiket/tiket_ada.dart';

import '../../../colors.dart';
import '../../../widgets/widget.dart';

class RutePage extends StatefulWidget {
  const RutePage({Key? key}) : super(key: key);

  @override
  State<RutePage> createState() => _RutePageState();
}

class _RutePageState extends State<RutePage> {
  // final
  final searchControllerBerangkat = TextEditingController();
  final searchControllerTujuan = TextEditingController();
  final dateController = TextEditingController();
  final ticketController = TextEditingController(text: '1');
  bool showSuggestions = false;

  // ! FITUR SEARCH BERANGKAT - TUJUAN.
  // ? List isi dari sarannya.
  List<ListSuggestions> mainListSuggestions = [
    ListSuggestions(namaStasiun: 'Bekasi'),
    ListSuggestions(namaStasiun: 'Jakarta'),
    ListSuggestions(namaStasiun: 'Cianjur'),
    ListSuggestions(namaStasiun: 'Bandung'),
    ListSuggestions(namaStasiun: 'Manggarai'),
  ];
  // ? List isi dari saran yg kosong.
  List<ListSuggestions> emptyListSuggestionsBerangkat = [];
  List<ListSuggestions> emptyListSuggestionsTujuan = [];

  // ? metode untuk ketika fieldnya di klik akan muncul saran pada kotak search.
  void buildSuggestionsBerangkat(String value) {
    setState(
      () {
        if (value.isEmpty) {
          emptyListSuggestionsBerangkat = mainListSuggestions;
        } else {
          emptyListSuggestionsBerangkat = mainListSuggestions
              .where((element) => element.namaStasiun!
                  .toLowerCase()
                  .contains(value.toLowerCase()))
              .toList();
        }
      },
    );
  }

  void buildSuggestionsTujuan(String value) {
    setState(
      () {
        if (value.isEmpty) {
          emptyListSuggestionsTujuan = mainListSuggestions;
        } else {
          emptyListSuggestionsTujuan = mainListSuggestions
              .where((element) => element.namaStasiun!
                  .toLowerCase()
                  .contains(value.toLowerCase()))
              .toList();
        }
      },
    );
  }

  void buildResultsBerangkat(int index) {
    buildSuggestionsBerangkat(
        emptyListSuggestionsBerangkat[index].namaStasiun!);
    String keteranganKeberangkatan =
        emptyListSuggestionsBerangkat[index].namaStasiun!;
    searchControllerBerangkat.text =
        'Stasiun keberangkatan: $keteranganKeberangkatan';
    setState(() {
      emptyListSuggestionsBerangkat = [];
    });
  }

  void buildResultsTujuan(int index) {
    buildSuggestionsTujuan(emptyListSuggestionsTujuan[index].namaStasiun!);
    String keteranganTujuan = emptyListSuggestionsTujuan[index].namaStasiun!;
    searchControllerTujuan.text = 'Stasiun tujuan: $keteranganTujuan';
    setState(() {
      emptyListSuggestionsTujuan = [];
    });
  }

  //! Fungsi untuk + dan - pesanan tiket
  // set State Counter
  void _counterMinus() {
    setState(() {
      if (int.parse(ticketController.text) > 1) {
        ticketController.text =
            (int.parse(ticketController.text) - 1).toString();
      }
    });
  }

  void _counterPlus() {
    setState(() {
      if (int.parse(ticketController.text) < 50) {
        ticketController.text =
            (int.parse(ticketController.text) + 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              showSuggestions = false;
            });
          },
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: ConstrainedBox(
                    //* karena kita membutuhkan container yang minimal lebih dari ukuran halamannya. maka kita, menggunakan Constrains Box.
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      children: [
                        appBarWidget('Pilih Rute', () {
                          Get.back();
                        }),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget(
                                  'Pilih stasiun keberangkatan\ndan stasiun tujuan kamu disini... ',
                                  blackColor,
                                  16,
                                  FontWeight.w500),
                              sizedBoxHeightWidget(20),
                              fieldBoxRuteBerangkat(
                                  'Pilih stasiun keberangkatan...'),
                              sizedBoxHeightWidget(20),
                              fieldBoxRuteTujuan('Pilih stasiun tujuan...'),
                              sizedBoxHeightWidget(20),
                              sizedBoxHeightWidget(3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [jumlahTiket(), tanggalBerangkat()],
                              ),
                              sizedBoxHeightWidget(20),
                              waktuPemesanan(),
                              sizedBoxHeightWidget(100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: bottomBarTotal(context),
                ),
              ],
            ),
          ),
        ));
  }

  // ! METHOD
  // ? RuteBox Berangkat
  Column fieldBoxRuteBerangkat(String hintText) {
    // Link yt : https://www.youtube.com/watch?v=jFHSkfjN96I
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffc8c8c8),
                offset: Offset(4, 6),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'^Stasiun keberangkatan:'))
                ],
                controller: searchControllerBerangkat,
                onChanged: (value) => buildSuggestionsBerangkat(value),
                onTap: () {
                  return setState(() {
                    showSuggestions = true;
                    buildSuggestionsBerangkat(searchControllerBerangkat.text);
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  filled: true,
                  fillColor: whiteColor,
                  focusColor: whiteColor,
                  prefixIcon: const Icon(Icons.search),
                  hintText: hintText,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              if (showSuggestions)
                Container(
                  constraints: BoxConstraints(
                      maxHeight: mainListSuggestions.length * 65),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: emptyListSuggestionsBerangkat.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                          '${emptyListSuggestionsBerangkat[index].namaStasiun}'),
                      onTap: () {
                        buildResultsBerangkat(index);
                        setState(() {
                          setState(() {
                            showSuggestions = false;
                          });
                        });
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ? RuteBox Tujuan
  Column fieldBoxRuteTujuan(String hintText) {
    // Link yt : https://www.youtube.com/watch?v=jFHSkfjN96I
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffc8c8c8),
                offset: Offset(4, 6),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'^Stasiun tujuan:'))
                ],
                controller: searchControllerTujuan,
                onChanged: (value) => buildSuggestionsTujuan(value),
                onTap: () {
                  return setState(() {
                    showSuggestions = true;
                    buildSuggestionsTujuan(searchControllerTujuan.text);
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  filled: true,
                  fillColor: whiteColor,
                  focusColor: whiteColor,
                  prefixIcon: const Icon(Icons.search),
                  hintText: hintText,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
              if (showSuggestions)
                Container(
                  constraints: BoxConstraints(
                      maxHeight: mainListSuggestions.length * 65),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: emptyListSuggestionsTujuan.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                          '${emptyListSuggestionsTujuan[index].namaStasiun}'),
                      onTap: () {
                        buildResultsTujuan(index);
                        setState(() {
                          setState(() {
                            showSuggestions = false;
                          });
                        });
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ? Jumlah Tiket
  Column jumlahTiket() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget('Jumlah tiket:', blackColor, 14, FontWeight.w500),
          sizedBoxHeightWidget(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: yellowColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: _counterMinus,
                        child: Icon(
                          Icons.remove,
                          size: 20,
                          color: whiteColor,
                        )),
                    SizedBox(
                      width: 60,
                      child: Expanded(
                        child: TextField(
                          controller: ticketController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 10),
                          ),
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: _counterPlus,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: whiteColor,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      );

  // ? Tanggal Berangkat
  Column tanggalBerangkat() {
    // todo: Ada showDialog ketika tanggalnya sudah lewat
    return Column(
      children: [
        textWidget('Tanggal berangkat:', blackColor, 14, FontWeight.w500),
        sizedBoxHeightWidget(4),
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: yellowColor,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(4, 6),
                    blurRadius: 10,
                    color: Color(0xffC8C8C8)),
              ]),
          child: TextField(
            controller: dateController,
            style: TextStyle(
                color: whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'YY/MM/DD',
              hintStyle: TextStyle(fontSize: 16, color: Colors.white),
              contentPadding: EdgeInsets.only(bottom: 10),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            readOnly: true,
            onTap: () {
              tambahTanggal();
            },
          ),
        ),
      ],
    );
  }

  // ? Bottm Bar Total Harga
  Row bottomBarTotal(BuildContext context) => Row(
        children: [
          Container(
            width: 228,
            height: 55,
            decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xffc8c8c8),
                      blurRadius: 10,
                      offset: Offset(4, 6)),
                ],
                border: Border.all(color: Colors.black.withOpacity(0.13))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    textWidget('Total', Colors.black54, 12, FontWeight.w500),
                    sizedBoxWidthWidget(5),
                    textWidget('Rp10.000', yellowColor, 24, FontWeight.w600),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => Get.to(const TiketAdaPage()),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: BoxDecoration(
                    color: const Color(0xffFFC500),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffc8c8c8),
                          blurRadius: 10,
                          offset: Offset(4, 6)),
                    ],
                    border: Border.all(color: Colors.black.withOpacity(0.13))),
                child: Center(
                  child:
                      textWidget('CHECKOUT', whiteColor, 16, FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      );

  // ? Tambah Tanggal
  Future<void> tambahTanggal() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = pickedDate.toString().split(' ')[0];
        // Check if the selected date is in the past
        if (DateTime.parse(dateController.text).isBefore(DateTime.now())) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Perhatian!'),
                content: const Text(
                    'Tanggal yang dipilih sudah lewat dari tanggal hari ini.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }
}

// ? Tambah waktu pemesanan
Container waktuPemesanan() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: yellowColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget('15:00', whiteColor, 14, FontWeight.normal),
          Icon(Icons.expand_more, color: whiteColor),
        ],
      ),
    );

class Faq {
  String? question, answer;
  bool isExpanded;
  Faq({
    this.question,
    this.answer,
    this.isExpanded = false,
  });
}
