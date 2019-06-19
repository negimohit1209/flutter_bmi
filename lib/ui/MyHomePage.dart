import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  Bmi({Key key}) : super(key: key);

  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  void _calculateBMI(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      if(( _ageController.text.isNotEmpty || age > 0 ) 
      && (_heightController.text.isNotEmpty || height > 0) 
      && (_weightController.text.isNotEmpty || weight > 0)){
        result = (weight * 10000) / (height * height); // our BMI
        if(double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
        }else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25){
          _resultReading = "Great Shape!";
        }else if(double.parse(result.toStringAsFixed(1)) >= 25.0 && result < 30){
          _resultReading = "Overweight";
        }else if(double.parse(result.toStringAsFixed(1)) >= 30.0){
          _resultReading = "Obese";
        }
      }else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI is ${double.parse(result.toStringAsFixed(1))}";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            child: ListView(
              padding: const EdgeInsets.all(2.0),
              children: <Widget>[
                Image.asset(
                  'images/bmi.png',
                  height: 85.0,
                  width: 75.0,
                ),
                Container(
                  margin: const EdgeInsets.all(3.0),
                  height: 245.0,
                  width: 290.0,
                  color: Colors.grey.shade300,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Age',
                            hintText: 'e.g 34',
                            icon: Icon(Icons.person_outline)),
                      ),
                      TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Height in cm',
                            hintText: 'e.g 165  ',
                            icon: Icon(Icons.insert_chart)),
                      ),
                      TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Weight in Kg',
                            hintText: 'e.g 65',
                            icon: Icon(Icons.line_weight)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.6),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: () =>  _calculateBMI(),
                            color: Colors.pink,
                            child: Text('Calculate'),
                            textColor: Colors.white,
                          )),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _finalResult,
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 19.9),
                    ),
                    Padding(padding: const EdgeInsets.all(5.0)),
                    Text(
                      "$_resultReading",
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 19.9),
                    ),
                  ],
                )
              ],
            )));
  }
}
