import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_yoklama_web/widgets/lessonstableWidgets/table.dart';

class LessonSelectionPage extends StatefulWidget {
  var dersler;
  final String userUID;

  LessonSelectionPage({
    super.key,
    required this.userUID,
    required this.dersler,
  });

  @override
  State<LessonSelectionPage> createState() => _LessonSelectionPageState();
}

class _LessonSelectionPageState extends State<LessonSelectionPage> {
  int dersHaftasi = 0;
  @override
  void initState() {
    //getHafta();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width >= height ? false : true;
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            const Divider(height: 3),
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage("assets/images/arkaPlanLogo.png"),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: mobile ? 2 : width / 5.7,
                  vertical: height / 80,
                ),
                padding: EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hoş Geldiniz',
                      style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 5, 50, 87),
                        letterSpacing: 2.0,
                        fontSize: width / 50,
                      ),
                    ),
                    Text(
                      'Yoklama başlatılacak saatleri program üzerinden seçiniz.',
                      style: GoogleFonts.robotoSlab(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(170, 5, 50, 87),
                        letterSpacing: 2.0,
                        fontSize: width / 100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 3,
                      indent: 320,
                      endIndent: 320,
                      color: Color.fromARGB(170, 5, 50, 87),
                    ),
                    const SizedBox(height: 40),

                    Center(
                      child: LessonTable(
                        userUID: widget.userUID,
                        dersler: widget.dersler,
                        dersHaftasi: dersHaftasi,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 3),
            Container(width: width, height: height / 3, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  void getHafta() async {
    final doc = await FirebaseFirestore.instance.doc('Fakulteler/100').get();
    String hafta = doc.get('ders_haftasi') ?? 'h0';
    dersHaftasi = int.parse(hafta.split("h")[0]);
  }
}
