import 'package:flutter/material.dart';
import 'package:test_app/onboard/presentation/pages/onboard_first.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const OnboardingScreen());

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          // SelectLanguagePage(
          //   controller: _controller,
          // ),
          OnboardFirst(
            image: 'images/001.png',
            title: 'sdfdsfds',
            subTitle1: 'asdasd',
            subTitle2:
                'в эффективном управлении времени и автоматизации контроля',
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
