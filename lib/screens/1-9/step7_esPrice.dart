import 'package:flutter/material.dart';
import 'step_widgets.dart';

class Step8EstimatedPrice extends StatelessWidget {
   final String service;
    const Step8EstimatedPrice({super.key,
    required this.service});

 @override
  Widget build(BuildContext context)=>
  Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children:[
      stepHeading('Estimated Service Price',''),
        SizedBox(height:38),
        Center(
        child:Text('Estimated price')),
          SizedBox(height:8),
          Center(
          child:Text('25.00 JOD',style:TextStyle(fontSize:36,fontWeight:FontWeight.w900))),
            SizedBox(height:28),
          stepCard([
            stepRow('Service',service),
            stepRow('Technician','Omar Khalil')]),
              SizedBox(height:16),
            stepInfo('This is an estimate. The final price may change after the technician checks the problem.')]
            );
}