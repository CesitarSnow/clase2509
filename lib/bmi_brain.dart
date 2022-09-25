
 import 'dart:math';

 class BMIBrain {
   double weight;
   double height;

   BMIBrain({
     this.weight = 0,
     this.height = 0,
   });

   double calculateBMI() {
     double bmi = weight / pow(height/100, 2);
     return bmi;
   }
 }