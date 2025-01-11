import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


Future<Uint8List> generateDocument(PdfPageFormat format, List<Map<String, dynamic>> items) async {
  items.sort((a, b) => (a['Company'] ?? "").compareTo(b['Company'] ?? ""));  // Ensure sorting

  final doc = pw.Document();
  // final image = pw.MemoryImage(
  //   (await rootBundle.load('lib/examples/assets/company_logo.png')).buffer.asUint8List(),
  // );



  doc.addPage(
      pw.MultiPage(
        build: (context) => [
          // pw.Container(
          //   alignment: pw.Alignment.topLeft,
          //   child: pw.Image(image, width: 100, height: 100),
          // ),


          pw.Paragraph(text: "Camera Outage Listed By Company:"),
          pw.Table.fromTextArray(

            cellAlignment: pw.Alignment.centerLeft,
            cellStyle: const pw.TextStyle(fontSize: 10),
            headerAlignment: pw.Alignment.center,
            cellHeight: 30,
            cellAlignments: {
              0: pw.Alignment.centerLeft,
              1: pw.Alignment.centerLeft,
              2: pw.Alignment.centerLeft,

            },
            border: const pw.TableBorder(
              top: pw.BorderSide(color: PdfColors.black,width: .5),
              bottom: pw.BorderSide(color: PdfColors.black,width: .5),
              left: pw.BorderSide(color: PdfColors.black,width: .5),
              right: pw.BorderSide(color: PdfColors.black,width: .5),
              horizontalInside: pw.BorderSide(color: PdfColors.black,width: .5), // Horizontal borders inside the table
              verticalInside: pw.BorderSide(color: PdfColors.black,width: .5), // Vertical borders inside the table
            ),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            headers: ['Company', 'Camera', 'Description'],
            columnWidths: const {
              0: pw.FixedColumnWidth(75), // Company
              1: pw.FixedColumnWidth(150), // Name
              2: pw.FlexColumnWidth(1),    // Description takes the remaining space
            },
            data: items.map((item) => [
              item['Company'] ?? "N/A",
              item['Camera'],
              item['Camera Description'] ?? "N/A",
            ]).toList(),
          ),
        ],
      )

  );

  return doc.save();
}
