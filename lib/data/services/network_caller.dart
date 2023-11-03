import 'dart:convert';
import 'dart:math';

import 'package:e_commerce_app/application/app.dart';
import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/presentation/state_holder/auth/auth_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(
    String url,
  ) async {
    try {
      Response response = await get(
        Uri.parse(url),
        // headers: {'token': AuthUtility.userInfo.token.toString()}
      );
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == ('success')) {
        return NetworkResponse(
            statusCode: response.statusCode,
            responseJson: jsonDecode(response.body),
            isSuccess: true);
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseJson: null);
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return NetworkResponse(
        isSuccess: false, statusCode: -1, responseJson: null);
  }

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'content-type': 'application/json',
            'token': AuthController.accessToken.toString()
          },
          body: jsonEncode(body));

      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            statusCode: response.statusCode,
            responseJson: jsonDecode(response.body),
            isSuccess: true);
      } else if (response.statusCode == 401) {
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseJson: null);
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return NetworkResponse(
        isSuccess: false, statusCode: -1, responseJson: null);
  }

  void goToLogin() {
    AuthController.clear();
    Navigator.pushAndRemoveUntil(
        CraftyBay.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => EmailVerificationScreen()),
        (route) => false);
  }
}
