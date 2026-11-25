import 'package:fixly_app/screens/home_screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';

class ConfirmationPage extends StatelessWidget { 
  const ConfirmationPage({super.key}); 
  @override
   Widget build(BuildContext context)=>
   Scaffold(
    backgroundColor:AppColors.background,
    appBar:AppBar(
      title: Text('Confirmation')
      ),
    body:Center(
      child:Padding(
        padding:EdgeInsets.all(24),
        child:Column(
          mainAxisSize:MainAxisSize.min,
          children:[
            Icon(Icons.check_circle,color:AppColors.green,size:64),
            SizedBox(height:22),
            Text('Request Submitted Successfully!',
            textAlign:TextAlign.center,
            style:TextStyle(
              fontSize:22,fontWeight:FontWeight.bold,color:AppColors.textPrimary)),
                SizedBox(height:12),
                Text('Your maintenance request has been submitted.'),
                SizedBox(height:24),
               ElevatedButton(
                 onPressed: () {
                   Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
                    );
                  },
              child:Text('Back to Home'))
              ]
              )
              )
              )
              );
               }
