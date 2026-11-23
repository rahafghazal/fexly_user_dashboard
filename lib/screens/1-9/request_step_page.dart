
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
