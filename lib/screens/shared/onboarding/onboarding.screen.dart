import 'package:flutter/material.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/screens/shared/login-screens/login.screen.dart';
import 'package:ziivah/theme/color.theme.dart';
import 'dart:io';

import 'components/onboarding-slide.class.dart';
import 'components/onboarding-slide.component.dart';
import 'components/onboarding_slides.const.dart';
import 'components/page-indicator.component.dart';
import 'components/text-progess.component.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnboardingSlider> slides = [];

  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  bool _isLoading = false;

  void initState() {
    super.initState();
    slides = onboardingSliders;
  }

  @override
  Widget build(BuildContext context) {
    //final CustomerService customerService = CustomerService();
    //customerService.create("ladji").then((result){ print(result);});

    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PageView.builder(
                controller: pageController,
                itemCount: slides.length,
                onPageChanged: (val) {
                  setState(() {
                    currentIndex = val;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingSliderComponent(
                    title: slides[index].title,
                    imageAssetPath: slides[index].image,
                    description: slides[index].description,
                  );
                }),
            bottomSheet: currentIndex != slides.length - 1
                ? Container(
                    height: Platform.isAndroid ? 50 : 40,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            pageController.animateToPage(slides.length - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          child: Container(
                            height: 30,
                            child: Center(
                              child: Text(
                                "PASSER",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            for (int i = 0; i < slides.length; i++)
                              currentIndex == i
                                  ? PageIndicationComponent(
                                      isCurrentPage: true,
                                    )
                                  : PageIndicationComponent(
                                      isCurrentPage: false,
                                    ),
                          ],
                        ),
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              pageController.animateToPage(currentIndex + 1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            child: Container(
                              height: 30,
                              child: Center(
                                child: Text(
                                  "SUIVANT",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: Platform.isAndroid ? 50 : 40,
                    color: primary,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: primary,
                      ),
                      child: (TextProgressComponent(
                        text: "commencer",
                        showProgress: _isLoading,
                      )),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
