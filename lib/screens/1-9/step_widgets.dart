import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';

Widget stepHeading(
  String title, 
  String subtitle) => 
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
     children: [
 Text(title, style:TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.textPrimary)),
  SizedBox(height: 8),
   Text(subtitle, style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
]);
Widget stepInfo(
  String text) =>
   Container(
    padding: EdgeInsets.all(14),
     decoration:
    BoxDecoration(color: AppColors.lightBlue, borderRadius: BorderRadius.circular(12)),
     child: Text(
      text, style: TextStyle(fontSize: 11, color: AppColors.textSecondary)));
Widget stepCard(
  List<Widget> children) =>
   Container(
    width: double.infinity, 
    padding: EdgeInsets.all(16), 
    decoration: 
    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.border)), 
    child: Column(
      children: children
      ));
Widget stepRow(
  String label, String value) => 
  Padding
  (padding: EdgeInsets.symmetric(vertical: 8), 
  child: 
  Row(
    children: [
      SizedBox(width: 100, 
      child:
        Text(label, style:  TextStyle(fontSize: 11, color: AppColors.textSecondary))), 
        Expanded(
        child: Text(
          value, textAlign: TextAlign.end, style:TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)
          )
          )
          ]
          )
          );
