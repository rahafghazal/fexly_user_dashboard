/*
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import '../home_screens/maintenance_model.dart';
import '/widgets/request_progress_bar.dart';
import 'request_step_page.dart';

class DescribeProblemPage extends StatefulWidget {
  final String categoryTitle;
  final MaintenanceService service;

  const DescribeProblemPage({
    super.key,
    required this.categoryTitle,
    required this.service,
  });

  @override
  State<DescribeProblemPage> createState() =>
      _DescribeProblemPageState();
}

class _DescribeProblemPageState
    extends State<DescribeProblemPage> {
  final TextEditingController problemController =
      TextEditingController();

  @override
  void dispose() {
    problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Describe Your Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RequestProgressBar(step: 1),
          
              const SizedBox(height: 10),
          
              const Text(
                'STEP 1 OF 9',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.primary,
                ),
              ),
          
              const SizedBox(height: 24),
          
              const Text(
                'Describe Your Problem',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
              ),
          
              const SizedBox(height: 8),
          
              const Text(
                'Tell us what needs a little expert attention.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
          
              const SizedBox(height: 18),
          
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        widget.service.icon,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.categoryTitle,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.service.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 22),
          
              const Text(
                'Problem description',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
          
              const SizedBox(height: 10),
          
              TextField(
                controller: problemController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      'Describe the maintenance problem in detail...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 15),
          
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RequestStepPage(
                          step: 2,
                          categoryTitle: widget.categoryTitle,
                          service: widget.service,
                          problem: problemController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text('Continue  →'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*
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
*/


import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import '../home_screens/maintenance_model.dart';
import '/widgets/request_progress_bar.dart';
import 'request_step_page.dart';

class DescribeProblemPage extends StatefulWidget {
  final String categoryTitle;
  final MaintenanceService service;

  const DescribeProblemPage({
    super.key,
    required this.categoryTitle,
    required this.service,
  });

  @override
  State<DescribeProblemPage> createState() =>
      _DescribeProblemPageState();
}

class _DescribeProblemPageState
    extends State<DescribeProblemPage> {
  final TextEditingController problemController =
      TextEditingController();

  @override
  void dispose() {
    problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Describe Your Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RequestProgressBar(step: 1),
          
              const SizedBox(height: 10),
          
              const Text(
                'STEP 1 OF 9',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.primary,
                ),
              ),
          
              const SizedBox(height: 24),
          
              const Text(
                'Describe Your Problem',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
              ),
          
              const SizedBox(height: 8),
          
              const Text(
                'Tell us what needs a little expert attention.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
          
              const SizedBox(height: 18),
          
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        widget.service.icon,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.categoryTitle,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.service.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 22),
          
              const Text(
                'Problem description',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
          
              const SizedBox(height: 10),
          
              TextField(
                controller: problemController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      'Describe the maintenance problem in detail...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 15),
          
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RequestStepPage(
                          step: 2,
                          categoryTitle: widget.categoryTitle,
                          service: widget.service,
                          problem: problemController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text('Continue  →'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
