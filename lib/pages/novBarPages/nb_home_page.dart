import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_yoklama_mobil/widgets/infoBox.dart';
import 'package:qr_yoklama_mobil/widgets/todayslessons.dart';

class NbHomePage extends StatefulWidget {
  const NbHomePage({super.key});

  @override
  State<NbHomePage> createState() => _NbHomePageState();
}

class _NbHomePageState extends State<NbHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 161, 201),
        image: DecorationImage(
          alignment: AlignmentGeometry.topCenter,
          image: AssetImage("assets/images/arkaPlanLogo.png"),
        ),
      ),
      width: width,
      height: height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 13),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Hoş geldin,',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  letterSpacing: 2.0,
                  fontSize: height / 60,
                ),
                softWrap: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Umut Sadıkoğlu',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,

                  fontSize: height / 48,
                ),
                softWrap: true,
              ),
            ),
            SizedBox(height: height / 300),
            Divider(endIndent: width / 20, indent: width / 20),
            SizedBox(height: height / 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  HPInfoBox(
                    iconBGColor: Colors.green,
                    icon: Icons.rule_rounded,
                    title: 'Devam Oranı',
                    subtitle: '%77',
                    column: true,
                  ),
                  HPInfoBox(
                    iconBGColor: const Color.fromARGB(255, 171, 213, 235),
                    icon: Icons.import_contacts_rounded,
                    title: 'Aktif Dersler',
                    subtitle: '8',
                    column: true,
                  ),
                  //gelecek
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  HPInfoBox(
                    iconBGColor: Colors.yellow.shade800,
                    icon: Icons.assignment_late_outlined,
                    title: 'Kritik Ders',
                    subtitle: '2',
                    column: true,
                  ),
                  HPInfoBox(
                    iconBGColor: Colors.redAccent,
                    icon: Icons.not_interested_rounded,
                    title: 'Kalınan Ders',
                    subtitle: '1',
                    column: true,
                  ),
                  //gelecek
                ],
              ),
            ),
            SizedBox(height: height / 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),

                  Container(
                    color: Colors.white54,
                    height: 1,
                    width: width / 3.5,
                  ),
                  Spacer(),

                  Text(
                    'Hızlı İşlemler',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                      fontSize: height / 52,
                    ),
                    softWrap: true,
                  ),
                  Spacer(),
                  Container(
                    color: Colors.white54,
                    height: 1,
                    width: width / 3.5,
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: height / 300),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  HPInfoBox(
                    iconBGColor: Colors.green.shade300,
                    icon: Icons.assessment_outlined,
                    title: 'Devamsızlık',
                    subtitle: '-',
                    column: false,
                  ),
                  HPInfoBox(
                    iconBGColor: Colors.green.shade300,
                    icon: Icons.event_note_outlined,
                    title: 'Ders Programı',
                    subtitle: '-',
                    column: false,
                  ),
                  //gelecek
                ],
              ),
            ),
            SizedBox(height: height / 300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),

                  Container(
                    color: Colors.white54,
                    height: 1,
                    width: width / 3.5,
                  ),
                  Spacer(),

                  Text(
                    'Günlük Program',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                      fontSize: height / 52,
                    ),
                    softWrap: true,
                  ),
                  Spacer(),
                  Container(
                    color: Colors.white54,
                    height: 1,
                    width: width / 3.5,
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: height / 300),
            Todayslessons(
              lsName: 'Veri Yapıları ve Algoritmalar',
              lsTeacher: 'Mehmet HACIBEYOĞLU',
              lsTime: '09:00 - 11:45',
              lsClassroom: 'D102',
            ),
            Todayslessons(
              lsName: 'Veri Tabanı Sistemleri',
              lsTeacher: 'Ahmet ÖZKIŞ',
              lsTime: '13:00 - 15:45',
              lsClassroom: 'C107',
            ),
          ],
        ),
      ),
    );
  }
}
