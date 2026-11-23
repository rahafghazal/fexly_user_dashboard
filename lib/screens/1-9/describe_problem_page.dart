
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
