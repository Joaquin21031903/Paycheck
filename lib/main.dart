import 'package:flutter/material.dart';
import 'package:flutter_application_3/certificate.dart';
import 'package:flutter_application_3/homepage.dart';
import 'package:flutter_application_3/login.dart';
import 'package:flutter_application_3/payroll.dart';
import 'package:flutter_application_3/personalInfo.dart';
import 'package:flutter_application_3/sickleaverequest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paycheck App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => Homepage(),
        '/login': (context) => LoginScreen(),
        '/personalInformation': (context) => PersonalInformationDetailsPage(),
        '/payslip': (context) => PayrollDetailsPage(),
        '/certifications': (context) => CertificationsPage(),
        '/sickLeaveRequest': (context) => SickLeaveRequestPage(),
      },
    );
  }
}

// Original Certifications Page
