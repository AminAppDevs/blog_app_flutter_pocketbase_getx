import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:blog_app_flutter_pocketbase_getx/screens/home_screen.dart';
import 'package:blog_app_flutter_pocketbase_getx/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        Get.offAll(() => HomeScreen());
      },
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: FadeInUp(
          duration: const Duration(milliseconds: 400),
          child: SvgPicture.asset(
            'assets/images/logo_white.svg',
            height: 80,
          ),
        ),
      ),
    );
  }
}
