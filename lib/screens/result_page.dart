import 'package:bmicalculator/components/Bottom_Button.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/container_maker.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final String? bmiResult, resultText, interpretation;

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results Page"),
        backgroundColor: Color(0xFF0A0D22),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text("Your Result" , style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerMaker(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText!.toUpperCase(),style: kResultStyle,),
                  Text(bmiResult! ,style: kBmiStyle,),
                  Column(
                    children: [
                      Text("Normal BMI Range:" , style: kGrayBodyTextStyle,),
                      Text("18.5 - 25 kg/m2", style: kBodyTextStyle,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        interpretation!,
                         style: kBodyTextStyle,
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}