import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/onboard/presentation/pages/select_language_page.dart';
import 'package:test_app/onboard/presentation/widgets/progress_indicator.dart';
import 'package:test_app/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushAndRemoveUntil(
              context, SelectLanguagePage.route(), (route) => false);
        }
      });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 134.h, bottom: 57.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/logo_sp.png',
                  width: 120.w,
                  height: 120.h,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 290.w,
                      child: Text(
                        'Умное управление',
                        style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                            .copyWith(
                                fontSize: 48.sp,
                                fontWeight: FontWeight.w300,
                                height: 0.8,
                                letterSpacing: -0.1),
                      ),
                    ),
                    SizedBox(
                      height: 41.h,
                    ),
                    ProgressIndicator1(animation: animation),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'ПРИЛОЖЕНИЕ',
                      style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      'ДИРЕКТОРА',
                      style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                          .copyWith(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(
                  'EDUS SMART',
                  style: AppTheme.lightThemeMode.textTheme.bodyMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
