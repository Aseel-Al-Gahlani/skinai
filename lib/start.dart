import 'package:flutter/material.dart';

import 'public/public_constant.dart';
import 'widgets/defoult_button.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        decoration:  boxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/image.png', fit: BoxFit.fill),
              const SizedBox(height: 50),
              const Text(
                'Welcome to SkinAI!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(
                width: 292,
                height: 45,
                child: Opacity(
                  opacity: 0.98,
                  child: Text(
                    'Analyse your skin condition and receive \n \n \n instant results and recommendations',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      // height: 0.09,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 150),
              DefaultButton(
                  buttonWidget: const Text(
                    'البدء',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  function: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  width: MediaQuery.of(context).size.width / 3,
                  radius: 15.0,
                  backgroundColor: Color(0xFF5775BE)),

              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
