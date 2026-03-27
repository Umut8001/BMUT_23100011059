import 'package:flutter/material.dart';

class NbProfile extends StatefulWidget {
  const NbProfile({super.key});

  @override
  State<NbProfile> createState() => _NbProfileState();
}

class _NbProfileState extends State<NbProfile> {
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Profil Bölümü
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xFF4A90E2),
                        child: Icon(Icons.person, size: 50),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Umut Sadıkoğlu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "No: 23100011059",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Bölüm Kartı
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "AKADEMİK",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color.fromARGB(220, 5, 50, 87),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(Icons.school, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    "Bölüm",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "Bilgisayar Müh.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // Uygulama Ayarları
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "UYGULAMA",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...[
                  {'icon': Icons.location_on, 'title': 'Konum İzinleri'},
                  {'icon': Icons.nightlight_round, 'title': 'Görünüm'},
                  {'icon': Icons.info, 'title': 'Hakkında'},
                ]
                .map(
                  (item) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(220, 5, 50, 87),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          item['icon'] as IconData,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          item['title'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            const SizedBox(height: 40),
            // Çıkış Butonu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFD32F2F)),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: Color(0xFFEF5350),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
