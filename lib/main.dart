// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pdfgenerate/genepdf.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool kisweb;
try{
    if(Platform.isAndroid||Platform.isIOS) {
        kisweb=false;
    } else {
        kisweb=true;
    }
} catch(e){
    kisweb=true;
}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Pdf_page(),
    );
  }
}


