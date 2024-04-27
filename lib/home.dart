import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'pages/diagnosis.dart';
import 'public/public_constant.dart';
import 'widgets/defoult_button.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isimage_selected = false;
  bool image_show_containervisible = false;
  File? _imageFile;
  String? _imagePath;
  String? sike;
  void _closeDialog() {
    setState(() {
      showDialog = false;
    });
  }

  bool showDialog = false;
  bool isLoading = false;
  void Pickimage(BuildContext context, ImageSource source) async {
    if (source != null) {
      final image = await ImagePicker().pickImage(
        source: source,
        //  imageQuality: 50, maxHeight: 500, maxWidth: 500
      );
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
          _imagePath = image.path;
          isimage_selected = true;
          image_show_containervisible = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: boxDecoration(),
            child: Column(
              children: [
                const SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                      buttonWidget: const Text(
                        'الصور',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 1.6,
                        ),
                      ),
                      function: () {
                        Pickimage(context, ImageSource.gallery);
                      },
                      width: MediaQuery.of(context).size.width / 2.4,
                      radius: 10.0,
                      backgroundColor:
                          Color(0xFF5775BE), //Color.fromARGB(255, 30, 91, 13),
                    ),
                    const SizedBox(width: 10),
                    DefaultButton(
                      buttonWidget: const Text(
                        'الكامرا',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 1.6,
                        ),
                      ),
                      function: () {
                        Pickimage(context, ImageSource.camera);
                      },
                      width: MediaQuery.of(context).size.width / 2.4,
                      radius: 7.0,
                      backgroundColor:
                          Color(0xFF5775BE), // Color.fromARGB(255, 30, 91, 13),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: isimage_selected
                      ? Image.file(_imageFile!,
                          height: 200, width: double.infinity, fit: BoxFit.fill)
                      : Image.asset('assets/bg.png',
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.fill),
                ),
                const SizedBox(height: 150),
                Center(
                  child: DefaultButton(
                    buttonWidget: const Text(
                      'تشخيص',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1.6,
                      ),
                    ),
                    function: () async {
                      setState(() {
                        showDialog = true;
                        isLoading = true;
                      });
                      final file = File(_imagePath!);
                      final bytes = await file.readAsBytes();
                      final encodedImage = base64Encode(bytes);

                      try {
                        // إجراء الطلب
                        final response = await http.post(
                          Uri.parse(uploadURL),
                          headers: {
                            "Content-Type": "application/x-www-form-urlencoded"
                          }, // تعيين نوع المحتوى إلى application/json
                          body: encodedImage, // ترميز الصورة كجسم طلب JSON
                        );
                        // قراءة وطباعة الاستجابة
                        print(response.body);
                        final jsonResponse = jsonDecode(response.body);
                        // يتم استخراج القيم واستخدامها
                        // استخراج القيمة المطلوبة من الاستجابة
                        final desiredValue = jsonResponse['predicted_classes'];
                        sike = desiredValue.toString();
                        if (sike == '[]') {
                          sike =
                              'لم يتم التعرف على المرض يرجى ادراج صوره واضحة';
                        }
                        setState(() {
                          isLoading = false;
                        });
                      } catch (e) {
                        sike = 'حدث خطأ أثناء إرسال الصورة: $e';
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },

                    width: MediaQuery.of(context).size.width / 2.4,
                    radius: 7.0,
                    backgroundColor:
                        Color(0xFF5775BE), // Color.fromARGB(255, 30, 91, 13),
                  ),
                ),
              ],
            ),
          ),
          visibilitydialog(
              showDialog,
              const Text(
                'نتائج التشخيص',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
              'Psoriasis', // اسم المرض
              _closeDialog),
        ],
      )),
    );
  }

  Visibility visibilitydialog(
      bool showDialog, Widget title, String text, clossdilog) {
    return Visibility(
      visible: showDialog,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Container(
          child: Center(child: title),
        ),
        contentPadding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
        scrollable: true,
        content: Column(
          children: [
            RichText(
              text: TextSpan(
                text: ' اسم المرض : ${text}',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultButton(
                  buttonWidget: const Text(
                    'رجوع',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 14.0,
                      // letterSpacing: 1.6,
                    ),
                  ),
                  function: () {
                    clossdilog();
                  },
                  width: MediaQuery.of(context).size.width / 4,
                  height: 40.0,
                  radius: 10.0,
                  backgroundColor:
                      Color(0xFF5775BE), // Color.fromARGB(255, 30, 91, 13),
                ),
                const SizedBox(width: 5),
                DefaultButton(
                  buttonWidget: const Text(
                    'وصفه علاجيه',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 14.0,
                      // letterSpacing: 1.6,
                    ),
                  ),
                  function: () {
                    clossdilog();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Diagnosis(
                            dise: text,
                          ),
                        ));
                    // Navigator.of(context).pushNamed('/MyWidget');

                    // Pickimage(context, ImageSource.camera);
                  },
                  width: MediaQuery.of(context).size.width / 3,
                  height: 40.0,
                  radius: 10.0,
                  backgroundColor:
                      Color(0xFF5775BE), // Color.fromARGB(255, 30, 91, 13),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
