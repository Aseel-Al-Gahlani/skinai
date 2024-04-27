import 'package:flutter/material.dart';

import '../data/doctorlist.dart';
import '../public/public_constant.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: boxDecoration(),
          child: Column(
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
                        icon: Icon(Icons.arrow_back)),
                    const Expanded(
                        child: Center(
                      child: Text(
                        'الاطباء المختصين',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.6,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(doctorlist.length, (index) {
                      return carddoctor(
                          doctorlist[index].name!,
                          doctorlist[index].phone.toString()!,
                          doctorlist[index].address!);
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container carddoctor(
    String name,
    String phone,
    String address,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStylesubhead(),
              ),
              Text(phone),
            ],
          ),
          Text(address),
        ],
      ),
    );
  }
}
