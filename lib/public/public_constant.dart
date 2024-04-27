import 'package:flutter/material.dart';

 const API_KEY = ''; // ادخل مفتاح API الخاص بك
const MODEL_ENDPOINT =''; // تحديد نقطة النهاية الخاصة بالنموذج
// بناء عنوان URL للطلب
const uploadURL = 'https://classify.roboflow.com/$MODEL_ENDPOINT?api_key=$API_KEY&name=YOUR_IMAGE.jpg';

BoxDecoration boxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.blue,
        Colors.white,
      ],
      // transform:
    ),
  );
}

TextStyle TextStylehead() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
}

TextStyle TextStylesubhead() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
}

 // begin: Alignment(0.00, -1.00),
            // end: Alignment(0, 1),
            // colors: [Color(0xFF4E6EBB), Colors.white],