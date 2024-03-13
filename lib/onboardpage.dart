import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertaskapp/loginepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  _OnboardingOneScreenState createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  List<Color> backcolor = [Colors.green, Colors.orange, Colors.amber];
  Color backcolorishere = Colors.green;
  final List<String> textHeading = [
    "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ",
    "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
    "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ",
  ];
  final List<String> texts = [
    "Quality",
    "Convenient",
    "Local",
  ];

  final List<String> backgroundImages = [
    "assets/images/img_group_44.png",
    "assets/images/img_group.png",
    "assets/images/img_group_46.png",
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < texts.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        // Change background color here
        backgroundColor: backcolorishere,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 26),
                SizedBox(
                  height: 320,
                  width: 390,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                        backcolorishere = backcolor[index];
                      });
                    },
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        backgroundImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(49),
                      topRight: Radius.circular(49),
                    ),
                  ),
                  width: screenWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        texts[_currentPage],
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 39),
                      Text(
                        textHeading[_currentPage],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 43),
                      AnimatedSmoothIndicator(
                        activeIndex: _currentPage,
                        count: texts.length,
                        effect: ScrollingDotsEffect(
                          spacing: 8.0,
                          activeDotColor: theme.colorScheme.primaryContainer,
                          dotColor:
                              theme.colorScheme.onSurface.withOpacity(0.5),
                          dotHeight: 7.0,
                          dotWidth: 7.0,
                        ),
                      ),
                      SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          // Button press functionality goes here
                        },
                        child: Text(
                          "Join the movement!",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(backcolorishere),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40)),
                        ),
                      ),
                      SizedBox(height: 18),
                      InkWell(
                        onTap: () {
                          // Login navigation or functionality goes here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: theme.textTheme.titleSmall?.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
