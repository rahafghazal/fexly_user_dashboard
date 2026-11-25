import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'step_widgets.dart';

class Step4ServiceLocation extends StatelessWidget {
   const Step4ServiceLocation({super.key});

 @override
  Widget build(
    BuildContext context)=>
    SingleChildScrollView(
      child:
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          stepHeading('Where Do You Need Service?','Choose the location for your service.'),
            SizedBox(height:20),
          Container(
            height:210,
            width:double.infinity,
            decoration:BoxDecoration(
              color:AppColors.lightBlue,
              borderRadius:BorderRadius.circular(16)),
              child:
              Center(
                child:
                Icon(Icons.location_pin,size:55,color:AppColors.primary)
                )
                ),
                  SizedBox(height:14),
                  OutlinedButton.icon(onPressed:(){},
                  icon: Icon(Icons.my_location),
                  label:Text('Use My Current Location')),
                    SizedBox(height:18),
                    Text('Address details'),
                    SizedBox(height:8),
                    TextField(
                    decoration:InputDecoration(
                      filled:true,
                      fillColor:Colors.white,
                      hintText:'Enter your address',
                      border:OutlineInputBorder())
                      )
                      ]
                      )
                      );
}