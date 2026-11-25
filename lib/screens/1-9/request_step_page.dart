/*
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import '../home_screens/maintenance_model.dart';
import '/widgets/request_progress_bar.dart';

class RequestStepPage extends StatelessWidget {
  final int step;
  final String categoryTitle;
  final MaintenanceService service;
  final String problem;

  const RequestStepPage({
    super.key,
    required this.step,
    required this.categoryTitle,
    required this.service,
    required this.problem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Service Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestProgressBar(step: step),

            const SizedBox(height: 10),

            Text(
              'STEP $step OF 9',
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: _buildStepContent(),
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (step < 9) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RequestStepPage(
                              step: step + 1,
                              categoryTitle: categoryTitle,
                              service: service,
                              problem: problem,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Request completed!'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      step == 9 ? 'Finish' : 'Continue',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (step) {
      case 2:
        return const SizedBox.shrink();
      case 3:
        return const SizedBox.shrink();
      case 4:
        return const SizedBox.shrink();
      case 5:
        return const SizedBox.shrink();
      case 6:
        return const SizedBox.shrink();
      case 7:
        return const SizedBox.shrink();
      case 8:
        return const SizedBox.shrink();
      case 9:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }
}
*/



import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import '../home_screens/maintenance_model.dart';
import '/widgets/request_progress_bar.dart';
import 'step2_image.dart';
import 'step3_location.dart';
import 'step4_dateTime.dart';
import 'step5_availableTech.dart';
import 'step6_confirmTech.dart';
import 'step7_esprice.dart';
import 'step8_review.dart';
import 'confirmation.dart';

class RequestStepPage extends StatelessWidget {

  final int step;  
  final String categoryTitle;
  final MaintenanceService service; 
  final String problem;
 const RequestStepPage({super.key,
 required this.step,
 required this.categoryTitle,
 required this.service,
 required this.problem});

 String get title {
  switch(step){
  case 2:return 'Upload Problem Photos';
  case 4:return 'Where Do You Need Service?';
  case 5:return 'Service Request';
  case 6:return 'Available Technicians';
  case 7:return 'Confirm Technician';
  case 8:return 'Estimated Service Price';
  case 9:return 'Review Maintenance Request';
  default:return 'Service Request';} }
 void next(BuildContext context){
   if(step==9){Navigator.push(
    context,
    MaterialPageRoute(builder:(_)=>
      ConfirmationPage()));
    return;}
      final nextStep=step==2?4:step+1;
      Navigator.push(context,
      MaterialPageRoute(builder:(_)=>RequestStepPage(
        step:nextStep,categoryTitle:categoryTitle,service:service,problem:problem))); }
 Widget content(){
  switch(step){
    case 2:return Step2UploadPhotos();
    case 4:return Step4ServiceLocation();
    case 5:return Step5Page();
    case 6:return Step6Technicians(service:service.title);
    case 7:return Step7ConfirmTechnician(service:service.title);
    case 8:return Step8EstimatedPrice(service:service.title);
    case 9:return Step9ReviewRequest(service:service.title,problem:problem);
    default:return SizedBox.shrink();}}
 @override
  Widget build(BuildContext context)=>
  Scaffold(
    backgroundColor:AppColors.background,
    appBar:AppBar(
      backgroundColor:Colors.white,
      title:Text(
        title,style:TextStyle(color:AppColors.textPrimary,fontWeight:FontWeight.bold))),
        body:SafeArea(
          child:Padding(
            padding:EdgeInsets.all(20),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                RequestProgressBar(step:step),
                  SizedBox(height:10),
                Text('STEP $step OF 9',style:TextStyle(fontSize:10,color:AppColors.textSecondary)),
                  SizedBox(height:22),
                Expanded(child:content()),
                  SizedBox(height:12),
                SizedBox(
                  width:double.infinity,
                  height:50,
                  child:ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor:AppColors.primary,foregroundColor:Colors.white),
                    onPressed:()=>next(context),
                    child:Text(step==9?'Submit Maintenance Request →':'Continue →'))
                    )
                    ]
                    )
                    )
                    )
                    );
}
