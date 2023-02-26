import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BMIResultActivity extends StatelessWidget {
  bool? gender;
  double? heightValue, ageValue, weightValue, resultValue;

  BMIResultActivity({super.key,
    this.gender,
    this.heightValue,
    this.ageValue,
    this.weightValue,
    this.resultValue
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
            "BMI Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black,)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Gender: ${
                    (gender!)?"Male":"Female"
                }",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                "Height: ${heightValue!.round()} CM",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                "Age: ${ageValue!.round()} Y",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                "Weight: ${weightValue!.round()} KG",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                "Result: ${resultValue!.round()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 13,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.orange,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        height: 13,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.yellowAccent],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        height: 13,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.yellowAccent, Colors.lightGreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        height: 13,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.lightGreen, Colors.green],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        height: 13,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.green, Colors.blueAccent],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                      )),
                  Expanded(
                      child: Container(
                        height: 13,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          gradient: LinearGradient(
                              colors: [Colors.blueAccent, Colors.blue],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.red,
                      ),
                      Text('Excessive obesity  ( <35 ).',
                          style: TextStyle(fontSize: 12), maxLines: 2),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.yellowAccent,
                      ),
                      Text('ghee (30 - 35).',
                          style: TextStyle(fontSize: 12), maxLines: 2),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                      Text('Over Weight  (25 - 30).',
                          style: TextStyle(fontSize: 12), maxLines: 2),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.indigo.withOpacity(0.8),
                      ),
                      const Text('healthy weight  (18 - 24).',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.blue,
                      ),
                      Text(
                        'underweight  ( <18 ).',
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
