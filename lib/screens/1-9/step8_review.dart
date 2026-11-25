import 'package:flutter/material.dart';
import 'step_widgets.dart';

class Step9ReviewRequest extends StatelessWidget {
    final String service,problem;
    const Step9ReviewRequest({super.key,
    required this.service,
    required this.problem});
  @override 
  Widget build(BuildContext context)=> 
  SingleChildScrollView(
  child:Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children:[
      stepHeading('Review Maintenance Request','Check your details before submitting.'),
      SizedBox(height:18),
      stepCard([
        stepRow('Service',service),
        stepRow('Description',problem.isEmpty?'Not provided':problem),
        stepRow('Location','Amman, Jordan'),
        stepRow('Technician','Omar Khalil'),
        stepRow('Estimated price','25.00 JOD')]),
        SizedBox(height:14),
        stepInfo('Please check your information before submitting the request.') ]
        )
        );
}