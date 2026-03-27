import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_yoklama_mobil/pages/home_page.dart';
import 'package:qr_yoklama_mobil/widgets/elevatedButton.dart';
import 'package:qr_yoklama_mobil/widgets/textFormField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController ogrNoController;
  late final TextEditingController tekSifreController;

  final String _siteKey = "6Lejk2ssAAAAAJ2wjhqDqR1T3n6B03Q5JGDIPC_0";
  final String _secretKey = "6Lejk2ssAAAAACCdObIpUQRmPJhU_6_-7NM8GSo5";

  // late RecaptchaV2Controller recaptchaV2Controller;

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    //recaptchaV2Controller = RecaptchaV2Controller();
    ogrNoController = TextEditingController();
    tekSifreController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 161, 201),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,

          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: AlignmentGeometry.topCenter,
              image: AssetImage("assets/images/arkaPlanLogo.png"),
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(20),

                  width: width,
                  height: height * 0.73,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 5, 50, 87),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'NECMETTİN ERBAKAN ÜNİVERSİTESİ YOKLAMA SİSTEMİ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: height / 50,
                          ),
                          softWrap: true,
                        ),
                        SizedBox(height: height / 70),
                        Text(
                          'Devam etmek için giriş yapın.',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            color: Colors.white54,
                            letterSpacing: 2.0,
                            fontSize: height / 60,
                          ),
                          softWrap: true,
                        ),

                        // SizedBox(height: height / 70),
                        //Divider(height: 2, indent: 50, endIndent: 50),
                        SizedBox(height: height / 20),
                        BuildTextFormField(
                          color: Colors.white,
                          width: width * 0.8,
                          text: 'Öğrenci Numarası',
                          icon: Icons.person_2_outlined,
                          suffix: false,
                          controller: ogrNoController,
                          isDark: false,
                          inputtype: TextInputType.text,
                          validator: null,
                          iconColor: Colors.white,
                        ),
                        SizedBox(height: height / 30),
                        BuildTextFormField(
                          color: Colors.white,
                          width: width * 0.8,
                          text: 'Tek Şifre',
                          icon: Icons.password_outlined,
                          suffix: true,
                          controller: tekSifreController,
                          isDark: false,
                          inputtype: TextInputType.text,
                          validator: null,
                          iconColor: Colors.white,
                        ),
                        SizedBox(height: height / 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Beni Hatırla',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                                letterSpacing: 2.0,
                                fontSize: height / 55,
                              ),
                            ),
                            SizedBox(width: width * 0.4),
                            Checkbox(
                              side: BorderSide(color: Colors.white),
                              activeColor: Colors.green,
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                                //_saveRememberMeData(rememberMe);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: height / 60),

                        //SizedBox(height: height / 50),
                        BuildButton(
                          color: Colors.green.shade900,
                          onTop: () {
                            _signIn();
                          },
                          width: width * 0.8,
                          text: 'Giriş Yap',
                          height: height / 20,
                          icon: Icons.double_arrow_outlined,
                          styleColor: Colors.white,
                          column: false,
                        ),
                        SizedBox(height: height / 60),
                        //SizedBox(height: height / 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Türkçe',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'English',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height / 100),
                        //Divider(height: 2, indent: 50, endIndent: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
