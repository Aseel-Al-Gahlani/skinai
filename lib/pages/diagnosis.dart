import 'package:flutter/material.dart';
import 'package:skinai/data/diseases.dart';
import 'package:skinai/models/disease.dart';

import '../public/public_constant.dart';
import '../widgets/defoult_button.dart';

class Diagnosis extends StatefulWidget {
  const Diagnosis({super.key, required this.dise});
  final String dise;
  @override
  State<Diagnosis> createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  @override
  Widget build(BuildContext context) {
    final namelie = 'hhhh';
    Disease disease = Diseaselist.firstWhere(
      (element) => element.name == widget.dise,
      orElse: () => Disease(name: 'Non',reason: 'Non',treatment_method: 'Non'),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: boxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              Expanded(
                                child: Center(
                                  child: Text('توصيات علاجيه',
                                      style: TextStylehead()),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('اسم المرض :  ${disease.name}',
                            style: TextStylesubhead()),
                        const SizedBox(height: 10),
                        Text('السبب :', style: TextStylesubhead()),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text:  TextSpan(
                              text: disease.reason,
                                  
                                  style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text('طريقه العلاج :', style: TextStylesubhead()),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text:  TextSpan(
                              text:disease.treatment_method,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        // Center(
                        //   child: DefaultButton(
                        //     buttonWidget: const Text(
                        //       'الاطباء المختصين',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 18.0,
                        //         letterSpacing: 1.6,
                        //       ),
                        //     ),
                        //     function: () {
                        //       Navigator.of(context).pushNamed('/Doctor');
                        //     },
                        //     width: MediaQuery.of(context).size.width / 2,
                        //     radius: 10.0,
                        //     backgroundColor: Color.fromARGB(255, 6, 198, 35),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              right: MediaQuery.of(context).size.width / 2 -
                  MediaQuery.of(context).size.width / 4,
              child: DefaultButton(
                buttonWidget: const Text(
                  'الاطباء المختصين',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1.6,
                  ),
                ),
                function: () {
                  Navigator.of(context).pushNamed('/Doctor');
                },
                width: MediaQuery.of(context).size.width / 2,
                radius: 10.0,
                backgroundColor:
                    Color(0xFF5775BE), // Color.fromARGB(255, 6, 198, 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
