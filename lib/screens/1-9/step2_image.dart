import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'step_widgets.dart';
class Step2UploadPhotos extends StatelessWidget { const Step2UploadPhotos({super.key});
 @override Widget build(BuildContext context) => SingleChildScrollView(
    child: 
    Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
            stepHeading('Upload Problem Photos','Help the technician understand your problem better.'), 
            const SizedBox(height: 28), 
            Row(children: [
                Expanded(
                    child:
                     _button(
                        Icons.add_photo_alternate_outlined,'Upload Image')),
                         const SizedBox(width: 12), 
                         Expanded(
                            child:
                             _button(Icons.videocam_outlined,'Upload Video'))]),
                              const SizedBox(height: 20),
                               Center(child:
                                TextButton.icon(onPressed: () {},
                                 icon: const Icon(Icons.camera_alt_outlined),
                                  label: const Text('Camera'))), 
                                  stepInfo('Images or videos, up to 20 MB per file.'), 
                                  const SizedBox(height: 18),
                                   const Center(child:
                                    Text('You can skip this step for now.'))]));
 Widget _button
 (IconData icon,String text)=>OutlinedButton(onPressed:(){}, 
 child: 
 Padding(padding: const EdgeInsets.symmetric(vertical:20), 
 child:
  Column(children:[
    Icon(icon,color:AppColors.primary),
     const SizedBox(height:8), 
     Text(text)])));
}