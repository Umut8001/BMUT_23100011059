import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_yoklama_web/widgets/drawerTextButton.dart';
import 'package:qr_yoklama_web/widgets/studentsListWidget/studentItem.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportsPage extends StatefulWidget {
  String userUID;
  List<QueryDocumentSnapshot>? dersler;
  ReportsPage({super.key, required this.userUID, required this.dersler});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<Map<String, dynamic>> dersListesi = [];
  List<String> idListesi = [];
  List<StudentItem> oAnkiOgrenciListesi = [];
  List<Map<String, dynamic>> oAnkipdfOgrenciListesi = [];
  String sezon = '', seciliDers = '', seciliDersId = '';

  @override
  void initState() {
    decodeDersler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool mobile = width >= height ? false : true;

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Divider(height: 3),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: AlignmentGeometry.centerRight,
                  image: AssetImage("assets/images/arkaPlanLogo.png"),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 34, vertical: 24),
                padding: EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      'Ders Raporları',
                      style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 5, 50, 87),
                        letterSpacing: 2.0,
                        fontSize: width / 50,
                      ),
                    ),
                    Text(
                      'Dönemlik katılım durumunu inceleyin ve PDF yoklama raporu oluşturun.',
                      softWrap: true,
                      style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(170, 5, 50, 87),
                        letterSpacing: 2.0,
                        fontSize: width / 100,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 3,
                      indent: 320,
                      endIndent: 320,
                      color: const Color.fromARGB(170, 5, 50, 87),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 600,
                          width: 300,
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
                                // Color(0xFF4A90E2),
                                // Color(0xFF5AA9F4),
                                // Color(0xFF7BC6FF),
                                // Color(0xFFEAF6FF),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'DERSLER',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,

                                      fontSize: width / 110,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.white24),

                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'KOD',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'DERS ADI',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: dersListesi.map((
                                  Map<String, dynamic> hucre,
                                ) {
                                  return TextButton(
                                    onPressed: () {
                                      setState(() {
                                        sezon =
                                            '${hucre['yil']} ${(hucre['sezon'] as String).toUpperCase()} Dönemi';
                                        seciliDers = hucre['dersAd'];
                                        seciliDersId = hucre['dersId'];
                                        ogrenciListesiYap();
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            hucre['dersId'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize:
                                                  seciliDersId ==
                                                      hucre['dersId']
                                                  ? 14
                                                  : 13.5,
                                              color:
                                                  seciliDersId ==
                                                      hucre['dersId']
                                                  ? Colors.white
                                                  : Colors.white60,
                                              fontWeight:
                                                  seciliDersId ==
                                                      hucre['dersId']
                                                  ? FontWeight.bold
                                                  : FontWeight.w400,
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            hucre['dersAd'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize:
                                                  seciliDersId ==
                                                      hucre['dersId']
                                                  ? 14
                                                  : 13.5,
                                              color:
                                                  seciliDersId ==
                                                      hucre['dersId']
                                                  ? Colors.white
                                                  : Colors.white60,
                                              fontWeight:
                                                  seciliDersId ==
                                                      hucre['dersId']
                                                  ? FontWeight.bold
                                                  : FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 600,
                          width: 1000,
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
                                // Color(0xFF5AA9F4),
                                //Color(0xFF7BC6FF),
                                // Color(0xFFEAF6FF),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    seciliDers,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,

                                      fontSize: width / 110,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    sezon,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,

                                      fontSize: width / 110,
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 300,
                                    child: Center(
                                      child: BuildDrawerButton(
                                        text: 'Dönemlik Raporu İndir (PDF)',
                                        icon: Icons.download_outlined,
                                        textColor: Colors.white,
                                        iconColor: Colors.white,
                                        onTop: () {
                                          setState(() {
                                            pdfOlusturVeIndir();
                                          });
                                        },
                                        fontW: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),

                              Divider(color: Colors.white24),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'NO',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'AD SOYAD',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'KATILIM',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'G.DERS',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'K.DERS',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'E.DERS',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'ORAN (%)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,

                                        fontSize: width / 110,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,

                                  child: Column(children: oAnkiOgrenciListesi),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 3),
            Container(width: width, height: height / 3, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  void decodeDersler() {
    dersListesi.clear();
    for (var doc in widget.dersler!) {
      String dersId = doc.id;

      final data = doc.data() as Map<String, dynamic>;
      String dersAd = data['ders_ad'];
      String sezon = data['sezon'];
      String yil = data['yil'];
      int islenen_ders_sayisi = data['islenen_ders_saati'];
      Map<String, int> ogrenciler = Map<String, int>.from(
        data['ogrenci_listesi'] ?? [],
      );
      List<String> idler = ogrenciler.keys.toList();
      debugPrint(ogrenciler.toString());
      Map<String, dynamic> element = {
        'dersId': dersId,
        'dersAd': dersAd,
        'sezon': sezon,
        'yil': yil,
        'ogrenciler': idler,
        'ogrenci_devamsizlik': ogrenciler,
        'islenen_ders_saati': islenen_ders_sayisi,
      };

      dersListesi.add(element);
    }

    print(dersListesi);
  }

  void ogrenciListesiYap() async {
    setState(() {
      oAnkiOgrenciListesi = [];
    });

    Map<String, dynamic>? seciliDersVerisi;
    for (var element in dersListesi) {
      if (element['dersId'] == seciliDersId) {
        seciliDersVerisi = element;
        break;
      }
    }

    if (seciliDersVerisi == null) return;

    List<String> idler = seciliDersVerisi['ogrenciler'];
    Map<String, int> devamsizliklar = seciliDersVerisi['ogrenci_devamsizlik'];
    int islenenDersSayisi = seciliDersVerisi['islenen_ders_saati'];

    // 3. Tüm kullanıcı dokümanlarını paralel olarak çek (Hız kazandırır)
    List<Future<DocumentSnapshot?>> futures = idler
        .map((id) => getUserDoc(id))
        .toList();

    List<DocumentSnapshot?> snapshots = await Future.wait(futures);

    List<StudentItem> geciciListe = [];

    for (var doc in snapshots) {
      if (doc != null && doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        String uid = doc.id;

        String ad = data['isim'] ?? '';
        String soyad = data['soyisim'] ?? '';
        String numara = data['ogr_no'] ?? '';

        int katilinanDers = devamsizliklar[uid] ?? 0;

        geciciListe.add(
          StudentItem(
            numara: numara,
            ad_soyad: '$ad $soyad',
            katilinan_ders: katilinanDers,

            gerceklesen_ders: islenenDersSayisi,
            eksik_ders: 14 - katilinanDers,
            katilim: 'ZORUNLU',
          ),
        );
        oAnkipdfOgrenciListesi.add({
          'isim': data['isim'] ?? '',
          'soyisim': data['soyisim'] ?? '',
          'ogr_no': data['ogr_no'] ?? '',
        });
      }
    }

    setState(() {
      oAnkiOgrenciListesi = geciciListe;
    });
  }

  Future<DocumentSnapshot?> getUserDoc(String uid) async {
    try {
      return await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> pdfOlusturVeIndir() async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.robotoRegular();
    final boldFont = await PdfGoogleFonts.robotoBold();

    pdf.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(base: font, bold: boldFont),
        pageFormat: PdfPageFormat.a4.landscape,
        margin: pw.EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 10),
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 2,

              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    textAlign: pw.TextAlign.center,
                    "Ders Yoklama Listesi",
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        textAlign: pw.TextAlign.start,
                        "Fakülte/Yüksekokul: ",
                        style: pw.TextStyle(
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        textAlign: pw.TextAlign.start,
                        "Ders Kodu: $seciliDersId",
                        style: pw.TextStyle(
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        textAlign: pw.TextAlign.start,
                        "Ders Adı: $seciliDers",
                        style: pw.TextStyle(
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        textAlign: pw.TextAlign.start,
                        "Program: ",
                        style: pw.TextStyle(
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        textAlign: pw.TextAlign.start,
                        "Şube Kodu: ",
                        style: pw.TextStyle(
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        textAlign: pw.TextAlign.start,
                        "Öğretim Elemanı: ",
                        style: pw.TextStyle(
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 2),
            pw.TableHelper.fromTextArray(
              headerStyle: pw.TextStyle(
                fontSize: 5,
                fontWeight: pw.FontWeight.bold,
              ),
              columnWidths: {
                0: pw.FlexColumnWidth(1.5),
                1: pw.FlexColumnWidth(6),
                2: pw.FlexColumnWidth(15),
                3: pw.FlexColumnWidth(4),
                4: pw.FlexColumnWidth(3),
                5: pw.FlexColumnWidth(3),
                6: pw.FlexColumnWidth(3),
                7: pw.FlexColumnWidth(3),
                8: pw.FlexColumnWidth(3),
                9: pw.FlexColumnWidth(3),
                10: pw.FlexColumnWidth(3),
                11: pw.FlexColumnWidth(3),
                12: pw.FlexColumnWidth(3),
                13: pw.FlexColumnWidth(3),
                14: pw.FlexColumnWidth(3),
                15: pw.FlexColumnWidth(3),
                16: pw.FlexColumnWidth(3),
                17: pw.FlexColumnWidth(3),
                18: pw.FlexColumnWidth(3),
              },
              headers: [
                '#',
                'Öğrenci No',
                'Adı Soyadı',
                'Alıs/Ö.Not',
                '1. Hafta',
                '2. Hafta',
                '3. Hafta',
                '4. Hafta',
                '5. Hafta',
                '6. Hafta',
                '7. Hafta',
                '8. Hafta',
                '9. Hafta',
                '10. Hafta',
                '11. Hafta',
                '12. Hafta',
                '13. Hafta',
                '14. Hafta',
              ],
              data: [],
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
