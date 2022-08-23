import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';

import '../controllers/home_controller.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Text('Cell 1'),
                    Text('Cell 2'),
                    Text('Cell 3'),
                  ]),
                  TableRow(children: [
                    Text('Cell 4'),
                    Text('Cell 5'),
                    Text('Cell 6'),
                  ])
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Center(child: pw.Text('data'));
                      }));
                  final file = File("example.pdf");
                  await file.writeAsBytes(await pdf.save());
                },
                child: Text("pdf"))
          ],
        ));
  }
}
