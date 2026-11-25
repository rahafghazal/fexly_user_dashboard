import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'step_widgets.dart';

class Step6Technicians extends StatelessWidget { 
  final String service; 
  const Step6Technicians({super.key,
  required this.service
  });
 @override 
 Widget build(
  BuildContext context)=>
  Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children:[
      stepHeading('Available Technicians','$service · Amman, Jordan'),
        SizedBox(height:14),
      stepInfo('Available technicians are shown below.'),
      SizedBox(height:12),
      ...['Mohammad Ali','Omar Khalil','Khaled Hassan'].map((name)=>
      Container(
        margin: EdgeInsets.only(bottom:10),
        padding: EdgeInsets.all(14),
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(14),
          border:Border.all(color:AppColors.border)),
          child:
          Row(
            children:[
              CircleAvatar(
                child:Icon(Icons.person)),
                SizedBox(width:12),
                Expanded(child:
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Text(name,style:TextStyle(fontWeight:FontWeight.bold)),
                      Text('Verified Technician · ★ 4.9') ])),
                      Text('Select')
                    ]
                    )
                    )
                    )
                    ]
                    );
}