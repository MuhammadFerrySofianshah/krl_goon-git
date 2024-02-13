// import 'dart:async';
// import 'package:flutter/material.dart';

// class HorizontalPhotoScroll extends StatefulWidget {
//   const HorizontalPhotoScroll({super.key});

//   @override
//   _HorizontalPhotoScrollState createState() => _HorizontalPhotoScrollState();
// }

// class _HorizontalPhotoScrollState extends State<HorizontalPhotoScroll> with SingleTickerProviderStateMixin {
//    // Inisialisasi controller untuk TabController
//   late TabController _tabController;

//   // Inisialisasi index tab dan jumlah tab
//   int _currentIndex = 0;
//   final int _tabCount = 3; // Sesuaikan dengan jumlah tab

//   // Timer untuk menggulir tab secara otomatis
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     // Inisialisasi TabController
//     _tabController = TabController(
//      length: widget.photoCount, vsync: this
//     );

//     // Set up timer untuk menggulir tab setiap 3 detik
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       // Ganti tab ke tab berikutnya
//       setState(() {
//         _currentIndex = (_currentIndex + 1) % _tabCount;
//         _tabController.animateTo(_currentIndex);
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // Hentikan timer dan controller saat widget di dispose
//     _timer.cancel();
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 125,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: const LinearGradient(
//           colors: [Color(0xffececec), Color(0xffDDDDDD)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight),
//           boxShadow: const [
//             BoxShadow(
//               offset: Offset(2, 2),
//               blurRadius: 3,
//               color: Color(0x5b3d3d3d),
//             ),
//           ],
//         ),
//       child: TabBarView(
//         controller: _tabController, // Gunakan controller TabBarView
//         children: 
//        List.generate(
//           widget.photoCount,
//           (index) => Image.asset(widget.photoPaths[index]),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';

// class HorizontalPhotoScroll extends StatefulWidget {
//   const HorizontalPhotoScroll({super.key});

//   @override
//   _HorizontalPhotoScrollState createState() => _HorizontalPhotoScrollState();
// }

// class _HorizontalPhotoScrollState extends State<HorizontalPhotoScroll> {
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;
//   double _scrollPosition = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       _scrollPosition += 200; // Width of each photo
//       if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
//         _scrollPosition = 0.0;
//       }
//       _scrollController.animateTo(
//         _scrollPosition,
//         duration: Duration(seconds: 1),
//         curve: Curves.ease,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       controller: _scrollController,
//       child: Row(
//         children: List.generate(
//           10,
//           (index) => Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               width: 200,
//               height: 200,
//               color: Colors.blueAccent,
//               child: Center(
//                 child: Text(
//                   'Photo ${index + 1}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:krl_goon/colors.dart';
// import 'package:krl_goon/pages/home/home_page.dart';

// class _HomePageState extends State<HomePage> {
//   late PageController _pageController;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();

//     // Set up timer untuk menggulir otomatis setiap 3 detik
//     _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
//       _pageController.nextPage(
//         duration: const Duration(seconds: 1),
//         curve: Curves.ease,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(
//             children: [
//               // Konten lainnya ...
//               Stack(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 125,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       gradient: const LinearGradient(
//                         colors: [Color(0xffececec), Color(0xffDDDDDD)],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       boxShadow: const [
//                         BoxShadow(
//                           offset: Offset(2, 2),
//                           blurRadius: 3,
//                           color: Color(0x5b3d3d3d),
//                         ),
//                       ],
//                     ),
//                     child: PageView(
//                       controller: _pageController,
//                       children: [
//                         Image.asset("assets/images/iklan-home.png"),
//                         Image.asset("assets/images/iklan-home.png"),
//                         Image.asset("assets/images/iklan-home.png"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               // Konten lainnya ...
//             ],
//           ),
//         ),
//       ),
//       // Tombol floating action lainnya ...
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel Slider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> images = [
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
  ];

   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Slider Example'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: images.map((String imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
