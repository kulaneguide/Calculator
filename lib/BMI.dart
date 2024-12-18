import 'package:flutter/material.dart';
class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0; // Initialized with default value
  String _bmiStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            _bmiResult != null
                ? Column(
              children: [
                Text(
                  'Your BMI: ${_bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _bmiStatus,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    String heightText = _heightController.text;
    String weightText = _weightController.text;

    if (heightText.isNotEmpty && weightText.isNotEmpty) {
      double height = double.tryParse(heightText) ?? 0.0;
      double weight = double.tryParse(weightText) ?? 0.0;

      if (height > 0 && weight > 0) {
        double bmi = weight / (height / 100 * height / 100);
        setState(() {
          _bmiResult = bmi;
          if (bmi < 18.5) {
            _bmiStatus = 'Underweight' ;
          } else if (bmi >= 18.5 && bmi < 25) {
            _bmiStatus = 'Normal' ;
          } else if (bmi >= 25 && bmi < 30) {
            _bmiStatus = 'Overweight' ;
          } else {
            _bmiStatus = 'Obese' ;
          }
        });
      } else {
        setState(() {
          _bmiResult = 0.0; // Reset to default value
          _bmiStatus = '';
        });
      }
    } else {
      setState(() {
        _bmiResult = 0.0; // Reset to default value
        _bmiStatus = '';
      });
    }
  }
}