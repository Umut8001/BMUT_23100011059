import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_yoklama_web/helper/aes256.dart';
import 'package:qr_yoklama_web/pages/qrCode_page.dart';
import 'package:qr_yoklama_web/widgets/lessonstableWidgets/tableItem.dart';

class LessonTable extends StatefulWidget {
  String userUID;
  int dersHaftasi;
  List<QueryDocumentSnapshot>? dersler;

  LessonTable({
    super.key,
    required this.userUID,
    required this.dersler,
    required this.dersHaftasi,
  });

  @override
  State<LessonTable> createState() => _LessonTableState();
}

class _LessonTableState extends State<LessonTable> {
  List<String> secilenDersler = [];

  //late String bolumId, fakulteId;

  final List<List<Map<String, dynamic>>> tablo = [
    // 1. SATIR: BAŞLIKLAR
    [
      {
        'icon': null,
        'bgColor': Colors.transparent,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.transparent,
        'borderColor': Colors.transparent,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'PAZARTESİ',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'SALI',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'ÇARŞAMBA',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'PERŞEMBE',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'CUMA',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'CUMARTESİ',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.transparent,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': 'PAZAR',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 2. SATIR: 09:00 - 09:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '09:00',
        'subtitle': '09:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 3. SATIR: 10:00 - 10:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '10:00',
        'subtitle': '10:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 4. SATIR: 11:00 - 11:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '11:00',
        'subtitle': '11:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 5. SATIR: 13:00 - 13:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '13:00',
        'subtitle': '13:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 6. SATIR: 14:00 - 14:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '14:00',
        'subtitle': '14:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 7. SATIR: 15:00 - 15:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '15:00',
        'subtitle': '15:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 8. SATIR: 16:00 - 16:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '16:00',
        'subtitle': '16:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 9. SATIR: 17:00 - 17:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '17:00',
        'subtitle': '17:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 10. SATIR: 18:00 - 18:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '18:00',
        'subtitle': '18:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],

    // 11. SATIR: 19:00 - 19:45
    [
      {
        'icon': null,
        'bgColor': Colors.black45,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.transparent,
        'title': '19:00',
        'subtitle': '19:45',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
      {
        'icon': null,
        'bgColor': Colors.black12,
        'sbtitleColor': Colors.white,
        'titleColor': Colors.white,
        'borderColor': Colors.white54,
        'title': '',
        'subtitle': '',
        'onTap': () {},
      },
    ],
  ];

  @override
  void initState() {
    decodeDersler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: BoxBorder.all(color: Colors.white24),
            color: Colors.white,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 5, 50, 87),
                Color.fromARGB(255, 49, 132, 227),
                //  Color(0xFF4A90E2),
                // Color(0xFF5AA9F4),
                // Color(0xFF7BC6FF),
                //  Color(0xFFEAF6FF),
              ],
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(15),

                child: Column(
                  children: tablo.map((List<Map<String, dynamic>> satir) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: satir.map((Map<String, dynamic> hucre) {
                        return Tableitem(
                          icon: hucre['icon'],
                          bgColor: hucre['bgColor'],
                          sbtitleColor: hucre['sbtitleColor'],
                          titleColor: hucre['titleColor'],
                          borderColor: hucre['borderColor'],
                          title: hucre['title'] ?? '',
                          subtitle: hucre['subtitle'] ?? '',
                          onTap: hucre['onTap'] ?? () {},
                          liste: secilenDersler,
                          satir: (tablo.indexOf(satir)),
                          sutun: (satir.indexOf(hucre)),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 50,
          width: 500,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: BoxBorder.all(color: Colors.white12),
          ),

          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Seçilenleri Temizle',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // 1. SEÇİM KONTROLÜ
                    if (secilenDersler.isEmpty) {
                      _uyariVer("Lütfen önce ders saatlerini seçin!");
                      return;
                    }

                    try {
                      List<int> gunler = [];
                      List<int> saatler = [];
                      List<String> dersKodlari = [];

                      // 2. VERİ AYRIŞTIRMA (0: Saat, 1: Gün kuralına göre)
                      for (var element in secilenDersler) {
                        List<String> parts = element.split("-");

                        // Senin belirttiğin sıra: 0. index saat, 1. index gün
                        int saat = int.parse(parts[0]);
                        int gun = int.parse(parts[1]);

                        // Tabloya erişim (decodeDersler ile aynı hiyerarşi: tablo[saat][gun])
                        if (saat < tablo.length && gun < tablo[saat].length) {
                          var hucre = tablo[saat][gun];
                          String? kod = hucre['dersKod'];

                          // NULL VEYA BOŞ KONTROLÜ (Hatanın asıl çözümü)
                          if (kod == null || kod.isEmpty) {
                            _uyariVer(
                              "Seçtiğiniz hücrede ($saat. saat, $gun. gün) tanımlı bir ders yok!",
                            );
                            return;
                          }

                          saatler.add(saat);
                          gunler.add(gun);
                          dersKodlari.add(kod);
                        }
                      }

                      // KURAL 1: Aynı Ders Kontrolü (Ders kodları aynı mı?)
                      if (!dersKodlari.every((k) => k == dersKodlari[0])) {
                        _uyariVer(
                          "Sadece aynı derse ait saatleri seçebilirsiniz!",
                        );
                        return;
                      }

                      // KURAL 2: Aynı Gün Kontrolü
                      if (!gunler.every((g) => g == gunler[0])) {
                        _uyariVer(
                          "Seçilen tüm saatler aynı gün içinde olmalıdır!",
                        );
                        return;
                      }

                      // KURAL 3: Ardışık Saat Kontrolü
                      saatler.sort();
                      for (int i = 0; i < saatler.length - 1; i++) {
                        if (saatler[i + 1] - saatler[i] != 1) {
                          _uyariVer(
                            "Ders saatleri birbirini takip etmelidir (arka arkaya)!",
                          );
                          return;
                        }
                      }

                      // KURAL 4: Maksimum 3 Saat
                      if (secilenDersler.length > 3) {
                        _uyariVer(
                          "Tek seferde en fazla 3 saat seçebilirsiniz.",
                        );
                        return;
                      }

                      String dsifre =
                          "${dersKodlari[0]}|"
                          "${secilenDersler.join(',')}|"
                          "h${widget.dersHaftasi.toString()}"; // Hafta

                      print("Ham Veri: $dsifre");

                      String sifreliMetin = AESHelper.encryptText(dsifre);

                      print("Şifreli Veri (QR): $sifreliMetin");

                      String kisaQr = sifreliMetin.substring(0, 8);

                      print("Kısa Şifreli Veri (QR ilk 8): $kisaQr");

                      /* yeniYoklamaOturumuBaslat(
                        haftaNo: widget.dersHaftasi,
                        qr: sifreliMetin,
                        kisaQr: kisaQr,
                        bolumId:
                            widget.dersler?[0][dersKodlari[0]]['fakulteId'],
                        dersKodu: dersKodlari[0],
                        dersHucreleri: secilenDersler,
                        fakulteId:
                            widget.dersler?[0][dersKodlari[0]]['fakulteId'],
                      );
                      */

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrcodePage(sifre: kisaQr),
                        ),
                      );
                    } catch (e) {
                      print("İşlem Hatası: $e");
                      _uyariVer("Bir hata oluştu: Bilgiler eksik veya hatalı.");
                    }
                  },
                  child: Text(
                    'Yoklama Al',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void decodeDersler() {
    if (widget.dersler == null) return;

    for (var doc in widget.dersler!) {
      final dynamic data = doc.data();
      if (data != null && data is Map) {
        final List? indexler = data['ders_takvimi'] as List?;

        if (indexler != null) {
          indexler.forEach((element) {
            try {
              if (element is Map) {
                int gun = int.parse(element['gun'].toString());
                int saat = int.parse(element['saat'].toString());
                if (gun < tablo.length && saat < tablo[gun].length) {
                  tablo[saat][gun]['title'] = data['ders_ad'] ?? '';
                  tablo[saat][gun]['subtitle'] = data['ders_sinif'] ?? '';
                  tablo[saat][gun]['dersKod'] = doc.id;
                }
              }
            } catch (e) {
              print("Hücre ayrıştırma hatası: $e");
            }
          });
        }
      }
    }
    setState(() {});
  }

  void dersListesineEkle(String dersKodu) {
    secilenDersler.add(dersKodu);
  }

  void _uyariVer(String mesaj) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesaj),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> yeniYoklamaOturumuBaslat({
    required int haftaNo,
    required String qr,
    required String kisaQr,
    required String bolumId,
    required String fakulteId,

    required String dersKodu,
    required List<String> dersHucreleri,
  }) async {
    String docName = "hafta_$haftaNo";

    print('-------------------------------->' + fakulteId + bolumId);

    final docRef = FirebaseFirestore.instance
        .collection('Fakulteler')
        .doc(fakulteId)
        .collection('Bolumler')
        .doc(bolumId)
        .collection('Dersler')
        .doc(dersKodu)
        .collection('Acilan_Yoklama_Oturumlari')
        .doc(docName);

    Map<String, dynamic> eklenecekVeriler = {
      'QR': qr,
      'kisaQr': kisaQr,
      'akif_mi': true,
      'baslangic_saati': FieldValue.serverTimestamp(),
      'son_gecerlilik_saati': DateTime.now().add(const Duration(minutes: 2)),
      'hafta': haftaNo,
      'konum': const GeoPoint(0.0, 0.0),
      'maks_mesafe': 40,
    };

    for (var hucre in dersHucreleri) {
      eklenecekVeriler['${hucre}KatilanlarId'] = [];
    }

    try {
      await docRef.set(eklenecekVeriler, SetOptions(merge: true));

      print("✅ $docName dökümanı başarıyla oluşturuldu.");
    } catch (e) {
      print("❌ Firebase Yazma Hatası: $e");
    }
  }
}
