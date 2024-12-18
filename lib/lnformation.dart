import 'package:flutter/material.dart';

import 'BMI.dart';
import 'calculcu;alator.dart';


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,


        title: Text(
          "Information",
          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 11,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text("Welcome",style:
              TextStyle(fontWeight: FontWeight.bold,fontSize:50,color: Colors.green),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 340,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Colors.green, foregroundColor: Colors.white,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculatorScreen()));
                }, child:Text("Calculator",
              style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w800
              ),),
              ),
            ),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 elevation: 4,
                 backgroundColor: Colors.red, foregroundColor: Colors.white,
               ),
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>BMICalculator()));
               },
                 child: Text("BMI",
                 style: TextStyle(
                   fontWeight: FontWeight.w800,
                   fontSize: 23
                 ),),),

          ],
        ),
        
      ),
    );
  }
}
