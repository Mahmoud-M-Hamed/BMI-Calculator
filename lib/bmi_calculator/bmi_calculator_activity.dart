import 'dart:math';
import 'package:flutter/material.dart';
import 'bmi_result_activity.dart';

class BMICalculatorActivity extends StatefulWidget {
  const BMICalculatorActivity({Key? key}) : super(key: key);

  @override
  BMICalculatorActivityState createState() => BMICalculatorActivityState();
}

class BMICalculatorActivityState extends State<BMICalculatorActivity> {
  double sliderValue = 120, ageValue = 20, weightValue = 65;
  double? result;
  Color? genderTypeCardColor = Colors.grey[300];
  bool isMale = true;

  Widget genderType({
    double? marginLeft,
    double? marginRight,
    IconData? genderIcon,
    String? gender,
    VoidCallback? onTap,
    VoidCallback? onTapCancel,
    Color? genderTypeCardColor,
  }) =>
      Expanded(
        child: Card(
          margin: EdgeInsets.only(
              left: marginLeft!, right: marginRight!, top: 10, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          elevation: 12,
          color: genderTypeCardColor,
          child: InkWell(
            splashColor: Colors.pink,
            onTap: onTap,
            onDoubleTap: onTapCancel,
            borderRadius: BorderRadius.circular(15),
            onLongPress: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  genderIcon,
                  size: 60,
                ),
                Text(
                  "$gender",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget ageAndWight({
    String? awController,
    String? yearsOrKG,
    double? ageValue,
    double? weightValue,
    String? minusHeroTag,
    String? plusHeroTag,
  }) =>
      Expanded(
        child: Card(
          margin:
              const EdgeInsets.only(left: 50, right: 30, top: 10, bottom: 10),
          color: Colors.grey[300],
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$awController",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "${(awController == "Age") ? this.ageValue.round() : this.weightValue.round()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    yearsOrKG!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: minusHeroTag,
                    onPressed: () {
                      if (awController == "Age") {
                        setState(() {
                          (this.ageValue <= 1)
                              ? this.ageValue = 1
                              : this.ageValue--;
                          ageValue = this.ageValue;
                        });
                      } else {
                        setState(() {
                          (this.weightValue <= 15)
                              ? this.weightValue = 15
                              : this.weightValue--;
                          weightValue = this.weightValue;
                        });
                      }
                    },
                    splashColor: Colors.pink,
                    backgroundColor: Colors.white,
                    elevation: 15,
                    mini: true,
                    child: const Icon(
                      Icons.remove_circle,
                      size: 25,
                      color: Colors.pink,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: plusHeroTag,
                    onPressed: () {
                      if (awController == "Age") {
                        setState(() {
                          (this.ageValue <= 1)
                              ? this.ageValue = 1
                              : this.ageValue++;
                          ageValue = this.ageValue;
                        });
                      } else {
                        setState(() {
                          (this.weightValue <= 15)
                              ? this.weightValue = 15
                              : this.weightValue++;
                          weightValue = this.weightValue;
                        });
                      }
                    },
                    splashColor: Colors.pink,
                    backgroundColor: Colors.white,
                    elevation: 15,
                    mini: true,
                    child: const Icon(
                      Icons.add_circle,
                      size: 25,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: const Text(
          "BMI",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  genderType(
                    gender: "Male",
                    genderIcon: Icons.male_outlined,
                    marginLeft: 50,
                    marginRight: 20,
                    genderTypeCardColor:
                        (isMale) ? genderTypeCardColor : Colors.grey[300],
                    onTap: () {
                      setState(() {
                        isMale = true;
                        (genderTypeCardColor == Colors.grey[300] || isMale)
                            ? genderTypeCardColor = Colors.pink
                            : genderTypeCardColor = Colors.grey[300];
                      });
                    },
                  ),
                  genderType(
                    gender: "Female",
                    genderIcon: Icons.female,
                    marginLeft: 20,
                    marginRight: 50,
                    genderTypeCardColor:
                        (!isMale) ? genderTypeCardColor : Colors.grey[300],
                    onTap: () {
                      setState(() {
                        isMale = false;
                        (genderTypeCardColor == Colors.grey[300] ||
                                isMale == false)
                            ? genderTypeCardColor = Colors.pink
                            : genderTypeCardColor = Colors.grey[300];
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${sliderValue.round()}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "CM",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                    activeColor: Colors.pink,
                    inactiveColor: Colors.black26,
                    max: 225,
                    min: 70,
                    thumbColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ageAndWight(
                    awController: "Age",
                    yearsOrKG: "y",
                    ageValue: 22,
                    minusHeroTag: 'ageMinus',
                    plusHeroTag: 'agePlus',
                  ),
                  ageAndWight(
                    awController: "Weight",
                    yearsOrKG: "kg",
                    weightValue: 65,
                    minusHeroTag: 'weightMinus',
                    plusHeroTag: 'weightPlus',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            splashColor: Colors.pink,
            padding: const EdgeInsetsDirectional.all(0),
            onPressed: () {
              setState(() {
                result = weightValue / pow(sliderValue / 100, 2);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BMIResultActivity(
                          gender: isMale,
                          ageValue: ageValue,
                          heightValue: sliderValue,
                          weightValue: weightValue,
                          resultValue: result,
                        )));
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 40,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 0.7),
              ),
              child: Center(
                child: Text(
                  'Calculate'.toUpperCase(),
                  style: const TextStyle(
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
