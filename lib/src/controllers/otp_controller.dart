import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance {
    return Get.find<OTPController>();
  }

  @override
  void onInit() {
    startTimer();
    log("OTP Timer has started");
    super.onInit();
  }

  //=========== Variables ===========\\

  late Timer _timer;

  //=========== Form Key ===========\\

  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\

  final emailEC = TextEditingController();
  final pin1EC = TextEditingController();
  final pin2EC = TextEditingController();
  final pin3EC = TextEditingController();
  final pin4EC = TextEditingController();

  //=========== Focus nodes ===========\\
  final pin1FN = FocusNode();
  final pin2FN = FocusNode();
  final pin3FN = FocusNode();
  final pin4FN = FocusNode();

  //=========== Booleans ===========\\
  var secondsRemaining = 30.obs;
  var isLoading = false.obs;
  var formIsValid = false.obs;
  var timerComplete = false.obs;

  //====================== Functions =========================\\

  //================= Onchanged ======================\\
  pin1Onchanged(value, context) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin2Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin3Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin4Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nearestScope;
      setFormIsValid();
      update();
    }

    update();
  }

  //================= Start Timer ======================\\
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
      } else {
        timerComplete.value = true;

        _timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  //================= Resend OTP ======================\\
  void requestOTP() async {
    secondsRemaining.value = 60;
    timerComplete.value = false;
    startTimer();
    update();
    log("Requesting OTP");
  }

  //================= Set form validity ======================\\

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== on Submitted ===========\\
  onSubmitted(value) {
    if (formIsValid.value == true) {
      submitOTP();
    }
  }

  //================= Send OTP ======================\\
  Future<void> submitOTP() async {
    isLoading.value == true;
    update();
    log("Submitting OTP");
  }
}