import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String message, [Color backgroundColor]) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    fontSize: 16.0,
    backgroundColor: backgroundColor ?? Colors.black,
  );
}

void onApiError(error, stack) {
  if (error is DioError) {
    if (error.type == DioErrorType.DEFAULT ||
        error.type == DioErrorType.RESPONSE) {
      if (error.response?.data is Map) {
        showToast("${error.response?.data["message"]}");
        print("${error.response?.data["message"]}");
        /*if (error.response?.statusCode == 401) {
            popAndNavigate(screen: LoginScreen());
          }*/
      } else {
        if (error?.message?.contains("Failed host lookup") ?? false) {
          showToast("You are offline");
        } else {
          showToast("Something went wrong");
        }
      }
    }

    print("ApiError $error \n$stack");

    if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
      showToast("Request time out");
    }

    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
      showToast("Connection time out");
    }

    if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
      showToast("Response time out");
    }

    if (error.type == DioErrorType.CANCEL) {
      showToast("Connection time out");
    }
  }
}
