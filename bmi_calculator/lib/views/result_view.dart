import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/views/home_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultView extends StatelessWidget {
  ResultView({super.key, required this.result});
  final double result;

// ≤ 18.4	Underweight
// 18.5 - 24.9	Normal
// 25.0 - 39.9	Overweight
// ≥ 40.0	Obese

  Color color = Colors.white;
  
  Color getColor() {
    if (result <= 18.4) {
      return Colors.red;
    } else if (result <= 24.9) {
      return Colors.green;
    } else if (result <= 39.9) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
  String getCategory() {
    if (result <= 18.4) {
      return 'Underweight';
    } else if (result <= 24.9) {
      return 'Normal';
    } else if (result <= 39.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
String getMessage() {
    if (result <= 18.4) {
      return 'You need to gain more weight';
    } else if (result <= 24.9) {
      return 'Good job';
    } else if (result <= 39.9) {
      return 'You need to decrease your weight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text('BMI Result',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        
        ),
        backgroundColor: AppColors.scaffoldBg,
        foregroundColor: AppColors.white,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              const SizedBox(
                height: 40,
              ),
              
              Container(
                decoration:BoxDecoration(shape: BoxShape.rectangle,color: AppColors.accent,borderRadius: BorderRadius.circular(20)
                
                ),
                height: MediaQuery.sizeOf(context).height / 2,
                  
            
            
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                getCategory(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: getColor(),
                ),
              ),
        
                      ]
                       
                    ),
                   const SizedBox(
                height: 60,
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
        
                children: [
                   Text(
                result.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight:FontWeight.w800,
                  
                  color: Colors.white,
                ),
              ) ,
        
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
        
                children: [
                   Text(
                    getMessage(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(
                        0xFFC9C9C9,
                      )
                    )
              ) ,
        
                ],
              )
        
        
                  ],
                ),
                
              
             
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                children: [
                  Expanded(child: SizedBox(
                    height: 70,
                    
                    child: ElevatedButton(onPressed: (){
                       Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => const HomeView()
                       )
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    )
                    , child:
                    const Text("Recalculate",
                    style: TextStyle(fontSize: 20, color: Colors.white,
                    fontWeight: FontWeight.w700
                    ),
                    
                    )
                                     ),
                  ))
                 
                ],
              ),
              const SizedBox(
                height: 20,
              )
             
            ],
          ),
        ),
      ),
    );
  }
}
