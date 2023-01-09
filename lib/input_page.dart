// ignore_for_file: prefer_const_constructors
import 'results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'reusable_column.dart';
import 'constant.dart';
import 'bottom_button.dart';
import 'round_iconButton.dart';
import 'function.dart';
enum GenderType { male, female, NULL }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late GenderType selectedGender = GenderType.NULL;
  int height = 180;
  int weight = 70;
  int AGE = 10;
  bool EnableDisable() {
    return selectedGender == GenderType.NULL ? false : true;
  }
  // Color maleCardcolor = inactivecardcolour;
  // Color femaleCardcolor = inactivecardcolour;
  // //1=male ,2=female
  // void updatecolor(GenderType gender) {
  //   //male car prassed
  //   if (GenderType.male==gender) {
  //     if (maleCardcolor == inactivecardcolour) {
  //       maleCardcolor = activecolour;
  //       femaleCardcolor=inactivecardcolour;
  //     } else {
  //       maleCardcolor = inactivecardcolour;
  //     }
  //   }
  //
  //   if (GenderType.female==gender) {
  //     if (femaleCardcolor == inactivecardcolour) {
  //       femaleCardcolor = activecolour;
  //       maleCardcolor=inactivecardcolour;
  //     } else {
  //       femaleCardcolor = inactivecardcolour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == GenderType.male
                        ? kActivecolour
                        : kInactivecardcolour,
                    cardChild: ReusableColumn(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == GenderType.female
                        ? kActivecolour
                        : kInactivecardcolour,
                    cardChild: ReusableColumn(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: selectedGender == GenderType.NULL
                  ? kInactivecardcolour
                  : kActivecolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberText,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'cm',
                        style: kLableTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Visibility(
                      visible: EnableDisable(),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(
                            () {
                              height = newValue.toInt();
                            },
                          );
                        },
                      ),
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
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },


                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },

                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActivecolour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          AGE.toString(),
                          style: kNumberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  AGE++;
                                });
                              },

                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  AGE--;
                                });
                              },


                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActivecolour,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CACULATE',
            onTap: () {
              CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResuts: calc.claculateBMI(),
                    ResultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


//constraints: BoxConstraints(minWidth: 10.0,maxWidth: 56.0,maxHeight: 56.0,minHeight: 10.0),
// constraints: BoxConstraints.tightFor(
//     width: MediaQuery.of(context).size.width * 0.8,
//     height: MediaQuery.of(context).size.height * 0.8),
// WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//
// }),