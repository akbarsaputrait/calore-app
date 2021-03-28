import 'package:flutter/material.dart';
import 'package:flutter_praktikum2_modul1/Background.dart';
import 'package:flutter_praktikum2_modul1/Components/RoundedButton.dart';
import 'package:flutter_praktikum2_modul1/Constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatefulWidget {
  final double height;
  final double weight;
  final double result;

  const ResultScreen({Key key, this.height, this.weight, this.result})
      : super(key: key);

  @override
  _ResultScreen createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Result',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20,
              //         color: textDarkColor)),
              CircularPercentIndicator(
                radius: 170.0,
                lineWidth: 15.0,
                animation: true,
                percent: (widget.result / 30),
                header: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tinggi Badan: ${widget.height}cm'),
                      SizedBox(width: 30),
                      Text('Berat Badan: ${widget.weight}kg')
                    ],
                  ),
                ),
                center: Text(
                  widget.result.toStringAsFixed(1),
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: textDarkColor,
                      fontStyle: FontStyle.normal),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: primaryColor,
              ),
              SizedBox(height: 20),
              DataTable(
                headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: textDarkColor),
                columns: <DataColumn>[
                  DataColumn(label: Text("Hasil")),
                  DataColumn(label: Text("Kategori")),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("< 18.5")),
                      DataCell(Text("Berat Badan Kurang")),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("18.5 - 22.9")),
                      DataCell(Text("Berat Badan Normal")),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("23.0 - 29.9")),
                      DataCell(Text("Berat Badan Berlebih")),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("> 30.0")),
                      DataCell(Text("Obesitas")),
                    ],
                  ),
                ],
              ),
              RoundedButton(
                text: "Kembali",
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
