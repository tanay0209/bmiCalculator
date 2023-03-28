import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BMICalculator(),
  ));
}
class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

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
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(15 , 15 , 15 , 10),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children:  [
            const Text('Check your BMI',
            style: TextStyle(
              fontSize: 28,
            ),
            ),
            const SizedBox(height: 40.0),
            TextField(
              decoration: const InputDecoration(
                suffix: Text('in cm'),
                labelText: 'Height',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                )
              ),
              keyboardType: TextInputType.number,
              controller: heightController,
            ),
            const SizedBox(height: 30.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Weight',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                ),
                suffix: Text('in kg'),
              ),
              keyboardType: TextInputType.number,
              controller: weightController,
            ),
            const SizedBox(height: 25.0),
             SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: (){
                        calculateBMI(heightController, weightController);},
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
                  child: const Text('Calculate BMI'),
              ),
            ),
            const SizedBox(height: 40),
            Text(result ,
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 10),
            Text(resultText,style: const TextStyle(fontSize: 25)
            ),
          ],
        ),
      ),
    );
  }
}
