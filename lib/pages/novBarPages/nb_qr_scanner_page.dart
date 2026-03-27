import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_yoklama_mobil/widgets/elevatedButton.dart';
import 'package:qr_yoklama_mobil/widgets/textFormField.dart';

class NbQrScannerPage extends StatefulWidget {
  const NbQrScannerPage({super.key});

  @override
  State<NbQrScannerPage> createState() => _NbQrScannerPageState();
}

class _NbQrScannerPageState extends State<NbQrScannerPage> {
  String scannedData = "Henüz tarama yapılmadı";
  late TextEditingController qrController;
  late MobileScannerController scannerController;
  double _currentZoom = 0.0;
  @override
  void initState() {
    qrController = TextEditingController();
    scannerController = MobileScannerController();
    qrController.text = scannedData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 161, 201),
            image: DecorationImage(
              alignment: AlignmentGeometry.topCenter,
              image: AssetImage("assets/images/arkaPlanLogo.png"),
            ),
          ),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(height: height / 14),
              Text(
                'QR Kodu Tara',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,

                  fontSize: height / 48,
                ),
                softWrap: true,
              ),
              Text(
                'Öğretmeninizin ekranındaki kodu okutun',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  letterSpacing: 2.0,
                  fontSize: height / 60,
                ),
                softWrap: true,
              ),
              SizedBox(height: height / 300),
              Divider(endIndent: width / 20, indent: width / 20),
              SizedBox(height: height / 50),

              Container(
                width: width * 0.9,
                height: height * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 5, 50, 87),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(18),
                        child: MobileScanner(
                          controller: scannerController,
                          onDetect: (barcodeCapture) {
                            final List<Barcode> barcodes =
                                barcodeCapture.barcodes;
                            for (final barcode in barcodes) {
                              setState(() {
                                scannedData =
                                    barcode.rawValue ?? "Veri bulunamadı";
                                qrController.text = scannedData;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height / 100),
                    BuildTextFormField(
                      color: Colors.white,
                      width: width * 0.8,
                      text: 'Kod',
                      iconColor: Colors.white,
                      icon: Icons.qr_code_rounded,
                      suffix: false,
                      controller: qrController,
                      isDark: false,
                      inputtype: TextInputType.multiline,
                      validator: null,
                    ),
                    SizedBox(height: height / 100),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Slider(
                padding: EdgeInsets.symmetric(horizontal: 50),
                thumbColor: Colors.green,
                allowedInteraction: SliderInteraction.tapAndSlide,
                activeColor: Colors.green.shade100,
                value: _currentZoom,
                onChanged: (value) {
                  setState(() {
                    _currentZoom = value;
                    scannerController.setZoomScale(
                      value,
                    ); // Kameraya zoom komutu gönderir
                  });
                },
              ),
              SizedBox(height: 8),
              SizedBox(
                height: height / 15,
                child: Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            scannedData = "Henüz tarama yapılmadı";
                            qrController.clear();
                          });
                        },
                        color: Colors.white,
                        iconSize: width / 15,
                        icon: Icon(Icons.delete_outline_sharp),
                      ),
                      BuildButton(
                        color: Colors.green,
                        onTop: () {},
                        width: width / 2,
                        text: 'Kodu Onayla',
                        height: height,
                        icon: Icons.arrow_forward_rounded,
                        styleColor: Colors.white,
                        column: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
