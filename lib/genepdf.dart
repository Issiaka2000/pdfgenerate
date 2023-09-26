
// ignore_for_file: unused_import, unused_local_variable, unused_element, unnecessary_string_interpolations

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/foundation.dart';

class invoiceInfo {

  final String name;
  final String date;
  final String companyName;
  final String cityName;
  final String numberHouse;
  final String contact;
  final String email;
  final String description;
  final String notes;
  final String Lighting;

  invoiceInfo({
    required this.name,
    required this.date,
    required this.companyName,
    required this.cityName,
    required this.numberHouse,
    required this.contact,
    required this.email,
    required this.description,
    required this.notes,
    required this.Lighting
  });
}

final invoices = [
  invoiceInfo(
    name:'YARO Emmanuel Bekassoé',
    date: '28-09-2000',
    companyName: 'Yaangre-Tech',
    cityName: 'Ouagadougou',
    numberHouse: 'Rue n° 345',
    contact: '+226 76-24-33-94',
    email: 'yaangretech@gmail.com',
    description: 'Une entreprise dans le domaine de la modernisation',
    notes: 'Exceptionnel',
    Lighting: 'Energy 60kWh'
  ),
];

class invoiceInfo1 {

  final String luminaireType;
  final String luminaireNumber;
  final String luminairePower;

  invoiceInfo1({
    required this.luminaireType,
    required this.luminaireNumber,
    required this.luminairePower,
  });
}

final invoices1 = [
  invoiceInfo1(
    luminaireType:'Electrical light',
    luminaireNumber: 'n° 4544545',
    luminairePower: '8986 j',
  ),
];

class Pdf_page extends StatefulWidget {
  const Pdf_page({super.key});

  @override
  State<Pdf_page> createState() => _Pdf_pageState();
}
class _Pdf_pageState extends State<Pdf_page> {

buildFooter(pw.Context context){
  return pw.Container(
    margin: pw.EdgeInsets.only(bottom: 15),
    child: pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.end,
    children: [
      pw.Text('Page ${context.pageNumber}',
      style: pw.TextStyle(fontSize: 7)
      ),
      pw.Text(' of ${context.pagesCount}',
      style: pw.TextStyle(fontSize: 7,color: PdfColors.blueGrey)
      ),
    ]
    )
  );

  }
  
Future<void> _createPDF() async {
 final image = pw.MemoryImage(
  File('C:/Users/Y-TECH/Documents/PDF_Generate/pdfgenerate/images/logo_siteco.png').readAsBytesSync(),
);
  final pdf = pw.Document();
pdf.addPage(
    pw.MultiPage(
      footer:(context) => buildFooter(context),
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.only(top:20,left:20,right: 20),
      build: (pw.Context context) => [pw.Container(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Image(
              width:80,
              height:50,
             image
            ),
            pw.SizedBox(height: 20),
            pw.Text('${invoices[0].name}',style: pw.TextStyle(fontSize: 11,color: PdfColors.red900,fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 15),
            pw.Text('Project data',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Date',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 151,),
                child: pw.Text('${invoices[0].date}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
             pw.Row(
              children: [
              pw.Text('Company',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 136),
                child: pw.Text('${invoices[0].companyName}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Postcode / town',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 116),
                child: pw.Text('${invoices[0].cityName}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Street, house no.',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 113),
                child: pw.Text('${invoices[0].numberHouse}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Contact Person',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 117),
                child: pw.Text('${invoices[0].contact}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Email',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 148),
                child: pw.Text('${invoices[0].email}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
             pw.Row(
              children: [
              pw.Text('Project description',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 107),
                child: pw.Text('${invoices[0].description}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Notes',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 147),
                child: pw.Text('${invoices[0].notes}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Lighting requirements \naccording to EN 12464-1',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 88),
                child: pw.Text('${invoices[0].Lighting}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 15),
            // system configuration part
            pw.Text('System configuration',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Luminaire type',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 118),
                child: pw.Text('${invoices1[0].luminaireType}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              children: [
              pw.Text('Number of luminaires',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 97),
                child: pw.Text('${invoices1[0].luminaireNumber}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            pw.SizedBox(height: 8),
             pw.Row(
              children: [
              pw.Text('Rated power luminaire',style: pw.TextStyle(fontSize: 7)),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 93),
                child: pw.Text('${invoices1[0].luminairePower}',style: pw.TextStyle(fontSize: 7)),
              ),
              ]
            ),
            // Energy consumption part
            pw.SizedBox(height: 15),
            pw.Text('Energy consumption',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('Energy consumption / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Energy consumption / system use duration',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Savings energy consumption',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('CO2 consumption / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('CO2 consumption / system use duration',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('CO2 savings',style: pw.TextStyle(fontSize: 7,color:PdfColors.green)),
            pw.SizedBox(height: 15),
            // Investment costs part
            pw.Text('Investment costs',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('State funding / funding rate',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Fee energy consultant',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Investment costs',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 15),
            // Energy costs
            pw.Text('Energy costs',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('Energy costs / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Energy costs / system use duration',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Savings energy costs',style: pw.TextStyle(fontSize: 7,color:PdfColors.green)),
            pw.SizedBox(height: 15),
            // Miantenance costs
            pw.Text('Maintenance costs',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('Maintenance costs / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Maintenance costs / system use duration',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Savings in maintenance costs',style: pw.TextStyle(fontSize: 7,color:PdfColors.green)),
            pw.SizedBox(height: 15),
            // Overall result
            pw.Text('Overall result',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('Total cost / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Total costs / system use duration',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Savings total costs',style: pw.TextStyle(fontSize: 7,color:PdfColors.green)),
            pw.SizedBox(height: 8),
            pw.Text('Payback time',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('CO2 savings / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('CO2 savings / system use duration',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 20),
            // Operating data
            pw.Text('Operating data',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('System utilisation',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Annual operating time',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Electricity price',style: pw.TextStyle(fontSize: 7,color:PdfColors.green)),
            pw.SizedBox(height: 8),
            pw.Text('Cost increase / year',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Average electricity price for TCO / kWh',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('CO2 factor / kWh',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 15),
            // Boundary conditions TCO
            pw.Text('Boundary conditions TCO',style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
            pw.Divider(borderStyle: pw.BorderStyle.solid, height: 8),
            pw.SizedBox(height: 8),
            pw.Text('Installation costs / luminaire',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Lamp replacement costs per luminaire',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Luminaire cleaning costs / luminaire',style: pw.TextStyle(fontSize: 7,color:PdfColors.green)),
            pw.SizedBox(height: 8),
            pw.Text('Luminaire cleaning intervals',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Room cleaning intervals',style: pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 8),
            pw.Text('Room cleaning costs',style: pw.TextStyle(fontSize: 7)),
             pw.SizedBox(height: 8),
            pw.Text('Lamp replacement intervals old system',style: pw.TextStyle(fontSize: 7)),
          ]
        ),
      ),
    ]
    ),
  );

  final file = File('Facture.pdf');
  await file.writeAsBytes(await pdf.save());

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('FACTURE',
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton(
            onPressed:(){
              _createPDF();
            },
            child: Text('Creer PDF',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
            )
          ],
        ),
      )
    );
  }
}