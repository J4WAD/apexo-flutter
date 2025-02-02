import 'package:apexo/utils/print/print.dart';
import 'package:apexo/features/settings/settings_stores.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:bidi/bidi.dart' as bidi;
import 'package:qr_flutter/qr_flutter.dart';

// Function to print a prescription
Future<void> printingPrescription(
    BuildContext context,
    List<String> prescription,
    String patientName,
    String patientAge,
    String patientLink) async {
  // Generate QR code image for PDF
  final qrImage = await QrPainter(
    data: patientLink,
    version: QrVersions.auto,
    errorCorrectionLevel: QrErrorCorrectLevel.H,
  ).toImageData(140);

  // Check if the context is still mounted
  if (context.mounted) {
    return printing(
      context,
      // Patient information
      "${String.fromCharCodes(bidi.logicalToVisual(patientName))} / $patientAge years old",
      // PDF content
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Prescription:"),
          pw.SizedBox(height: 5),
          // Generate prescription list
          ...List<pw.Widget>.generate(prescription.length, (index) {
            final e = prescription[index];
            return pw.Text("${index + 1}. ${e.split("-").join(" ")}");
          }),
          pw.SizedBox(height: 10),
          // Add QR code image to PDF
          pw.Center(
              child: pw.Image(
            pw.MemoryImage(qrImage!.buffer.asUint8List()),
            width: 150,
            height: 150,
            fit: pw.BoxFit.cover,
          )),
        ],
      ),
      // Footer information
      "${String.fromCharCodes(bidi.logicalToVisual(globalSettings.get("prescriptionFot").value))}\nPrescription printed on ${DateFormat(localSettings.dateFormat).format(DateTime.now())}.\nFor more information: please contact ${globalSettings.get("phone__________").value}.",
    );
  }
}
