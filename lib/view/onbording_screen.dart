import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/map_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<dynamic> sliderList = [
    ImagesPath.obCoffeeImg,
    ImagesPath.obMotorImg,
  ];

  void nextPage() {
    if (_currentIndex < sliderList.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
      );
    } else {}
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _currentIndex == 0 ? LinearGradient(colors: [
            AppTheme.blackColor,
            AppTheme.blackColor,
          ]) : LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [AppTheme.primaryColor, AppTheme.blackColor],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.8,width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: size.height * 0.4,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: sliderList.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return RepaintBoundary(
                            child: Image.asset(
                              sliderList[index],
                              fit: _currentIndex < 1 ? BoxFit.cover : null,
                              cacheHeight: 600,
                              cacheWidth: 600,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    top: _currentIndex < 1 ? 380 : 400,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _currentIndex < 1
                                ? AppConstants.os1TitleTxt
                                : AppConstants.os2TitleTxt,
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                          SizedBox(height: 16),
                          Text(
                            _currentIndex < 1 ? AppConstants.os1SubTxt : '',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          _currentIndex < 1 ? SizedBox(height: 85) : SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              2,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 600),
                                height: 6,
                                width: _currentIndex == index ? 24 : 8,
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: _currentIndex == index
                                      ? AppTheme.primaryColor
                                      : AppTheme.secColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _currentIndex < 1
                ? FloatingActionButton(
                    onPressed: () {
                      nextPage();
                    },
                    child: Icon(Icons.arrow_forward_ios_outlined),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 66,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MapScreen(),));
                        },
                        child: Text(
                          AppConstants.getStartBtnTxt,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
