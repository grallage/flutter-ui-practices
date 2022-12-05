import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo07/intro_screen.dart';
import 'package:flutter_ui_practices/screens/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Demo07OnboardingScreen extends StatefulWidget {
  const Demo07OnboardingScreen({super.key});

  @override
  State<Demo07OnboardingScreen> createState() => _Demo07OnboardingScreenState();
}

class _Demo07OnboardingScreenState extends State<Demo07OnboardingScreen> {
  // controller to keep track of which page we're on
  late PageController _controller;
  bool isLastPage = false;
  bool isFirstPage = false;
  String direction = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      isFirstPage = true;
    });
    _controller = PageController()..addListener(_listener);
  }

  _listener() {
    // setState(() {
    //   if (direction != 'right' &&
    //       _controller.position.userScrollDirection == ScrollDirection.reverse) {
    //     direction = 'right';
    //   } else if (direction != 'left' &&
    //       _controller.position.userScrollDirection == ScrollDirection.forward) {
    //     direction = 'left';
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get canScroll {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // pages
          PageView(
            controller: _controller,
            // https://abhishekdoshi26.medium.com/scrollphysics-in-flutter-9979008e861f
            /// NeverScrollableScrollPhysics
            /// BouncingScrollPhysics
            /// ClampingScrollPhysics
            /// FixedExtentScrollPhysics
            /// PageScrollPhysics
            physics: const ClampingScrollPhysics(),
            // physics: canScroll
            //     ? const ScrollPhysics()
            //     : const NeverScrollableScrollPhysics(),
            onPageChanged: ((index) {
              setState(() {
                isFirstPage = (index == 0);
                isLastPage = (index == 2);
              });
            }),
            children: const [
              Demo07IntroScreen(
                backgroundColor: Colors.blue,
              ),
              Demo07IntroScreen(
                backgroundColor: Colors.red,
              ),
              Demo07IntroScreen(
                backgroundColor: Colors.teal,
              ),
            ],
          ),
          // dot indicators
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text('skip')),
                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),
                // next or done
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: ((context) {
                              return const HomeScreen();
                            }),
                          ), (route) => false);
                        },
                        child: const Text('done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: const Text('next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
