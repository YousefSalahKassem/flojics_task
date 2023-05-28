import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class NetworkFailedContainer extends StatelessWidget {
  const NetworkFailedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Failed To Connect",style: TextStyles.displayLarge,),),
    );
  }
}
