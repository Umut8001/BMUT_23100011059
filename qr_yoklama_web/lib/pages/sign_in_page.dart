import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recaptcha_v2_compat/flutter_recaptcha_v2_compat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_yoklama_web/pages/home_page.dart';
import 'package:qr_yoklama_web/widgets/elevatedButton.dart';
import 'package:qr_yoklama_web/widgets/textFormField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController tcNoController;
  late final TextEditingController tekSifreController;

  final String _siteKey = "6Lejk2ssAAAAAJ2wjhqDqR1T3n6B03Q5JGDIPC_0";
  final String _secretKey = "6Lejk2ssAAAAACCdObIpUQRmPJhU_6_-7NM8GSo5";

  late RecaptchaV2Controller recaptchaV2Controller;

  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    recaptchaV2Controller = RecaptchaV2Controller();
    tcNoController = TextEditingController();
    tekSifreController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool mobile = width >= height ? false : true;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 161, 201),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: AlignmentGeometry.centerRight,
                    image: AssetImage("assets/images/arkaPlanLogo.png"),
                  ),
                ),
                child: Padding(
                  padding: mobile
                      ? EdgeInsetsGeometry.symmetric(
                          vertical: height / 9,
                          horizontal: width / 10,
                        )
                      : EdgeInsets.symmetric(
                          vertical: height / 9,
                          horizontal: width / 2.8,
                        ),
                  child: Container(
                    width: width / 3.5,
                    height: height / 1.3,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: BoxBorder.all(),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          SizedBox(height: height / 100),
                          Image.asset(
                            "assets/images/neu.png",
                            height: height / 7,
                          ),
                          SizedBox(height: height / 100),
                          Text(
                            'NECMETTİN ERBAKAN ÜNİVERSİTESİ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 2.0,
                              fontSize: mobile ? width / 35 : width / 100,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            'YOKLAMA SİSTEMİ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: 2.0,
                              fontSize: mobile ? width / 35 : width / 100,
                            ),
                            softWrap: true,
                          ),
                          SizedBox(height: height / 70),
                          Text(
                            'Giriş Yapın',
                            style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              letterSpacing: 2.0,
                              fontSize: mobile ? width / 25 : width / 50,
                            ),
                            softWrap: true,
                          ),
                          SizedBox(height: height / 70),
                          Divider(height: 2, indent: 50, endIndent: 50),
                          SizedBox(height: height / 20),

                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                BuildTextFormField(
                                  color: Colors.black,
                                  width: mobile ? width * 0.7 : width / 4,
                                  text: 'TC Kimlik Numarası',
                                  icon: Icons.person_2_outlined,
                                  suffix: false,
                                  controller: tcNoController,
                                  isDark: false,
                                  inputtype: TextInputType.text,
                                  validator: null,
                                ),
                                SizedBox(height: height / 30),
                                BuildTextFormField(
                                  color: Colors.black,
                                  width: mobile ? width * 0.7 : width / 4,
                                  text: 'Tek Şifre',
                                  icon: Icons.password_outlined,
                                  suffix: true,
                                  controller: tekSifreController,
                                  isDark: false,
                                  inputtype: TextInputType.text,
                                  validator: null,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height / 60),
                          Container(
                            width: mobile ? width * 0.7 : width * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Beni Hatırla',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                    letterSpacing: 2.0,
                                    fontSize: mobile ? width / 40 : width / 100,
                                  ),
                                ),
                                Checkbox(
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
                          ),

                          SizedBox(height: height / 50),
                          BuildButton(
                            color: Colors.green.shade900,
                            onTop: () {
                              signIn(
                                tcNoController.text,
                                tekSifreController.text,
                              );
                            },
                            width: mobile ? width * 0.7 : width / 4,
                            text: 'Giriş Yap',
                            height: height / 20,
                            icon: Icons.double_arrow_outlined,
                            styleColor: Colors.white,
                            column: false,
                          ),
                          SizedBox(height: height / 100),
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
                          Divider(height: 2, indent: 50, endIndent: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(height: 3),
              Container(
                width: width,
                height: height / 3,
                color: Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn(String tcNo, String password) async {
    String email = "$tcNo@erbakan.edu.tr";

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        final data = userDoc.data() as Map<String, dynamic>;
        String role = data['rol'] ?? '';

        if (!mounted) return;

        if (role == 'ogretmen') {
          print("Öğretmen paneline yönlendiriliyor...");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(userUID: uid)),
          );
        } else if (role == 'ogrenci') {}
      } else {
        print("Hata: /Users/$uid yolu bulunamadı. Firestore'u kontrol et!");
      }
    } on FirebaseAuthException catch (e) {
      print("Auth Hatası: ${e.code} - ${e.message}");
    } catch (e) {
      print("Beklenmedik Hata: $e");
    }
  }
}
