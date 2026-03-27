import 'package:flutter/material.dart';
import 'package:qr_yoklama_mobil/pages/novBarPages/nb_home_page.dart';
import 'package:qr_yoklama_mobil/pages/novBarPages/nb_profile.dart';
import 'package:qr_yoklama_mobil/pages/novBarPages/nb_qr_scanner_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final _kTabPages = <Widget>[NbHomePage(), NbQrScannerPage(), NbProfile()];

    final _kBottomNovBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.home_outlined),
        ),

        label: 'Ana Sayfa',
      ),
      BottomNavigationBarItem(
        icon: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.5),
            borderRadius: BorderRadius.circular(15),
            color: Colors.green.shade900,
            //backgroundBlendMode: BlendMode.exclusion,
          ),

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.qr_code_scanner_rounded),
          ),
        ),
        label: 'QR Yoklama',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined),
        label: 'Profil',
      ),
    ];

    assert(_kTabPages.length == _kBottomNovBarItems.length);
    var bottomNavBar = BottomNavigationBar(
      iconSize: width / 15,
      backgroundColor: Color.fromARGB(255, 5, 50, 87),
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: width / 14),
      selectedFontSize: width / 32,
      unselectedFontSize: width / 35,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.white70,
      items: _kBottomNovBarItems,
      currentIndex: _currentTabIndex,
      elevation: 0,
      type: BottomNavigationBarType.fixed,

      onTap: (int value) {
        setState(() {
          _currentTabIndex = value;
        });
      },
    );
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent, ),
      body: Container(
        color: Color.fromARGB(255, 0, 161, 201),
        child: _kTabPages[_currentTabIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 161, 201),
          borderRadius: BorderRadius.only(),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: bottomNavBar,
        ),
      ),
    );
  }
}
