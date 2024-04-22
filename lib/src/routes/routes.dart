import 'package:get/get.dart';
import 'package:kribb/app/auth/signup/screen/signup.dart';
import 'package:kribb/app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import 'package:kribb/app/onboarding/screen/onboarding.dart';
import 'package:kribb/app/splash/screens/startup_splash.dart';

import '../../app/auth/email_otp/screen/email_otp.dart';
import '../../app/auth/login/screen/login.dart';
import '../../app/auth/phone_otp/screen/phone_otp.dart';

class Routes {
  //Splash screens
  static const startupSplashscreen = "/";

  //Onboarding
  static const onboarding = "/onboarding";

  //Auth Screens
  static const signup = "/signup";
  static const login = "/login";
  static const emailOTP = "/email-otp";
  static const phoneOTP = "/phone-otp";
  static const forgotPassword = "/forgot-password";
  static const resetPassword = "/reset-password";
  static const changePassword = "/change-password";

  //KYC Screens
  static const kycAddLocation = "/kyc-add-location";

  //Get Pages
  static final getPages = [
    //Auth Pages
    GetPage(name: startupSplashscreen, page: () => const StartupSplashscreen()),
    GetPage(name: onboarding, page: () => const Onboarding()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: emailOTP, page: () => const EmailOTP()),
    GetPage(name: phoneOTP, page: () => const PhoneOTP()),

    //KYC Pages
    GetPage(name: kycAddLocation, page: () => const KycAddLocation()),
  ];
}
