import 'package:bmicalculator/screens/result_page.dart';

import '../components/container_maker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/column_maker.dart';
import '../constants.dart';
import '../components/Bottom_Button.dart';
import '../components/Round_icon_button.dart';
import '../calculator.dart';


enum Gender{
  male,
  female,
}



class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 100;
  int weight = 40;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0D22),
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerMaker(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    child: ColumnMaker(
                      icon: FontAwesomeIcons.mars,
                      gender:"Male",
                    )
                  ),
                ),
                Expanded(
                  child: ContainerMaker(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female; 
                      });
                    },
                    color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    child: ColumnMaker(
                      icon: FontAwesomeIcons.venus ,
                      gender:"Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerMaker(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle,),
                      Text("cm" , style: kLabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1FEB1555) ,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerMaker(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT" , style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),

                  ),
                ),
                Expanded(
                  child: ContainerMaker(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: "CALCULATE",
            onTap: (){
              Calculator hesab = Calculator(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: hesab.CalculateBMI() ,  
                resultText: hesab.getResult(),
                interpretation:hesab.getInterpretation(),
              )));
              
            },
          ),
        ],
      )
        

        
      
    );
  }
}






