class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n Sahayak',
    image: 'images/onboarding_image_1.png',
  ),
  OnBoarding(
    title: 'Humans Helping Humans', //slogan-1
    image: 'images/onboarding_image_2.png',
  ),
  OnBoarding(
    title: 'Slogan -2', //slogan-2
    image: 'images/onboarding_image_3.png',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    image: 'images/onboarding_image_4.png',
  ),
];
