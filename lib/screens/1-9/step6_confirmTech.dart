import 'package:flutter/material.dart';
import 'step_widgets.dart';

class Step7ConfirmTechnician extends StatelessWidget {
   final String service;
    const Step7ConfirmTechnician({super.key,
    required this.service});
 @override
  Widget build(BuildContext context)=>
  Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children:[
      stepHeading('Confirm Technician','Review your selected technician.'),
      SizedBox(height:22),
      ListTile(
        contentPadding:EdgeInsets.zero,
        leading:CircleAvatar(
          child:Icon(Icons.person)),
          title:Text('Omar Khalil'),
          subtitle:Text('Verified Technician · ★ 4.8')),
            SizedBox(height:16),
          stepCard([
            stepRow('Service',service),
            stepRow('Technician','Omar Khalil'),
            stepRow('Date & time','To be confirmed')]
            )
            ]
            );
}