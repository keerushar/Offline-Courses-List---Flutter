import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfview/viewpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? pdf1PDF = "";
  String? pdf2PDF = "";
  String? pdf3PDF = "";
  String? pdf4PDF = "";
  String? pdf5PDF = "";

  void initState() {
    super.initState();
    fromAsset('assets/sample.pdf', 'sample.pdf').then((f) {
      setState(() {
        pdf1PDF = f.path;
      });
    });
    fromAsset('assets/course1.pdf', 'course1.pdf').then((f) {
      setState(() {
        pdf2PDF = f.path;
      });
    });
    fromAsset('assets/course2.pdf', 'course2.pdf').then((f) {
      setState(() {
        pdf3PDF = f.path;
      });
    });
    fromAsset('assets/course3.pdf', 'course3.pdf').then((f) {
      setState(() {
        pdf4PDF = f.path;
      });
    });
    fromAsset('assets/course4.pdf', 'course4.pdf').then((f) {
      setState(() {
        pdf5PDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offline files view"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Course 1"),
              onPressed: () {
                if (pdf1PDF != null || pdf1PDF!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: pdf1PDF),
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                "Course 2",
              ),
              onPressed: () {
                if (pdf2PDF != null || pdf2PDF!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: pdf2PDF),
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                "Course 3",
              ),
              onPressed: () {
                if (pdf3PDF != null || pdf3PDF!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: pdf3PDF),
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text(
                "Course 4",
              ),
              onPressed: () {
                if (pdf4PDF != null || pdf4PDF!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: pdf4PDF),
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.brown),
              ),
              child: Text(
                "Course 5",
              ),
              onPressed: () {
                if (pdf5PDF != null || pdf5PDF!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(path: pdf5PDF),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
