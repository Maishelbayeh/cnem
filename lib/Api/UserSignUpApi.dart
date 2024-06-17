import 'dart:convert';
import 'dart:html';
import 'package:cenem/model/userModel.dart';
import 'package:cenem/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> signUpUser(User user) async {
  final String proxyUrl = 'http://${proxyurl}/Account/register';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  final Map<String, dynamic> body = user.toJson();

  print('Request body: $body');

  try {
    final http.Response response = await http.post(
      Uri.parse(proxyUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Sign-up successful!');

      return true;
    } else {
      print('Failed to sign up. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error during sign-up: $e');
    showErrorDialog('Error during sign-up: $e');
    return false;
  }
}

void showErrorDialog(String errorMessage) {
  window.alert(errorMessage);
}