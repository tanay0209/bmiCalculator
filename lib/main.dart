import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BMI_Calculator(),
  ));
}
class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  State<BMI_Calculator> createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {

  var heightController =  TextEditingController();
  var weightController = TextEditingController();
  var result = "";
  String resultText = '' ;
  double calculateBMI(var heightString , var weightString)
  {
    var heightString = heightController.text;
    var weightString = weightController.text;
    double height = (double.parse(heightString))/100;
    double weight =double.parse(weightString);
    double calculatedBMI = double.parse((weight/(height*height)).toStringAsFixed(2));
    if(heightString == '' || weightString == '' )
    {
      setState(() {
        result = 'Please fill all the details';
      });
    }
    else if(calculatedBMI >= 25 && calculatedBMI <29.9)
    {
      setState((){
        result = '$calculatedBMI';
        resultText = 'Overweight';
      });
    }
    else if( (18.5 < calculatedBMI) && (calculatedBMI < 25))
    {
      setState((){
        result = '$calculatedBMI';
        resultText = 'Healthy';
      });
    }
    else if(calculatedBMI>=30)
    {
      setState((){
        result = '$calculatedBMI';
        resultText = 'Obesity';
      });
    }
    else
    {
      setState((){
        result = '$calculatedBMI';
        resultText = 'Underweight';
      });
    }
    return calculatedBMI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15 , 15 , 15 , 10),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Text('Check your BMI',
            style: TextStyle(
              fontSize: 28,
            ),
            ),
            SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(
                suffix: Text('in cm'),
                labelText: 'Height',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )
              ),
              keyboardType: TextInputType.number,
              controller: heightController,
            ),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Weight',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                ),
                suffix: Text('in kg'),
              ),
              keyboardType: TextInputType.number,
              controller: weightController,
            ),
            SizedBox(height: 25.0),
            Container(
              width: 200,
              child: ElevatedButton(
                  child: Text('Calculate BMI'),
                  onPressed: (){
                        double value = calculateBMI(heightController, weightController);},
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
              ),
            ),
            SizedBox(height: 40),
            Text(result ,
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(height: 10),
            Text(resultText,style: TextStyle(fontSize: 25)
            ),
          ],
        ),
      ),
    );
  }
}
