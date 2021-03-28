import 'package:flutter/material.dart';
import 'package:flutter_praktikum2_modul1/Background.dart';
import 'package:flutter_praktikum2_modul1/Components/RoundedButton.dart';
import 'package:flutter_praktikum2_modul1/Components/rounded_input_field.dart';
import 'package:flutter_praktikum2_modul1/Constants.dart';
import 'package:flutter_praktikum2_modul1/Screens/Result.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreen createState() => _CalculatorScreen();
}

class _CalculatorScreen extends State<CalculatorScreen> {
  final TextEditingController _heightInput = TextEditingController();
  final TextEditingController _weightInput = TextEditingController();

  // snackBar Widget
  snackBar(String message, int duration) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selamat Datang di Calore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: textDarkColor)),
              SvgPicture.asset(
                "assets/images/calculator.svg",
                height: size.height * 0.4,
              ),
              // SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Body Mass Index (BMI) atau Indeks Massa Tubuh (IMT) adalah angka yang menjadi penilaian standar untuk menentukan apakah berat badan Anda tergolong normal, kurang, berlebih, atau obesitas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: textDarkColor),
                ),
              ),
              SizedBox(height: 10),
              RoundedInputField(
                  hintText: 'Tinggi Badan (Centimeter)',
                  keyboardType: TextInputType.number,
                  controller: _heightInput,
                  icon: Icons.accessibility, suffix: Text('cm')),
              RoundedInputField(
                  hintText: 'Berat Badan (Kilogram)',
                  keyboardType: TextInputType.number,
                  controller: _weightInput,
                  icon: Icons.directions_run, suffix: Text('kg')),
              RoundedButton(
                text: "HITUNG",
                onPressed: () async {
                   if (_heightInput.text == '' || _weightInput.text == '') {
                     snackBar("Terdapat kesalahan input", 2);
                   } else {
                     var height = double.parse(_heightInput.text);
                     var weight = double.parse(_weightInput.text);
                     var newHeight = (height / 100) * (height / 100);

                     double result = weight / newHeight;
                     Navigator.of(context)
                         .push(_createRoute(height, weight, result))
                         .then((value) {
                       _heightInput.clear();
                       _weightInput.clear();
                     });
                   }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _createRoute(double height, double weight, double result) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(
        height: height,
        weight: weight,
        result: result,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
