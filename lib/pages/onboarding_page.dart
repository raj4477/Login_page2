import 'package:flutter/material.dart';
import 'package:login_page_2/main.dart';
import 'package:login_page_2/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../style.dart';
import '../size_config.dart';
import '../widgets/widgets.dart';
import '../models/onboard_data.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  // Future setSeenonboard() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   seenOnboard = await prefs.setBool('seenOnboard', true);
  //   // this will set seenOnboard to true when running onboard page for first time.
  // }

  @override
  void initState() {
    super.initState();
    
    //  setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Text(
                    onboardingContents[index].title,
                    style: kTitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Container(
                    height: sizeV * 50,
                    child: Image.asset(
                      onboardingContents[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: kBodyText1,
                      children: [
                        TextSpan(text: 'WE CAN '),
                        TextSpan(
                            text: 'HELP YOU ',
                            style: TextStyle(
                              color: kPrimaryColor,
                            )),
                        TextSpan(text: 'TO MAKE A BETTER '),
                        TextSpan(text: 'VERSION OF '),
                        TextSpan(
                          text: 'SOCIETY',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                currentPage == onboardingContents.length - 1
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom:30.0,left: 15.0),
                          child: OnBoardNavBtn(name: 'Previous', onPressed: (){
                          _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      }),
                        ),
                        // SizedBox(
                         
                        //   width: 50.0,

                        // ),
                        MyTextButton(
                            buttonName: 'Get Started',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                            bgColor: kPrimaryColor,
                          ),
                      ],
                    )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(
                            name: 'Skip',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          ),
                          Row(
                            children: List.generate(
                              onboardingContents.length,
                              (index) => dotIndicator(index),
                            ),
                          ),
                          OnBoardNavBtn(
                            name: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                          )
                        ],
                      ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
