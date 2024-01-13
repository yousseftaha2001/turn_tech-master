import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:quickalert/quickalert.dart';

class RequestController extends GetxController{

  bool displayServicesList = false;
  bool displayCalendar = false;

  Rx<DateTime> today = DateTime.now().obs;

  List<String> servicesList = [
    'Mobile Application Development',
    'Web Application Development',
    'IT Services',
    'Desktop Application',
    'Software',
    'Hardware',
  ];

  void onDaySelected(DateTime day , DateTime focusedDay )
  {
    today.value = day;
  }


  // Developer gmail : turntechapplication@gmail.com
  // Developer gmail pass : turntech_2024


  Future sendEmail({required String service , required String name, required String date , required String emailmessage , required context }) async {

    final email = 'turntechapplication@gmail.com';
    final appPassword = 'dxjx susc oxfe ctum';
    final smp = gmail('turntechapplication@gmail.com', appPassword);


    // final smtpServer = gmailSaslXoauth2(email, accessToken);

    final message = Message()
      ..from = Address(email, 'TurnTech Mobile Application')
      ..recipients.add('moaazibrahim721@gmail.com')
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Exciting News: New Request'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content\nName: $name\nService: $service\nDate: $date\nMessage: $emailmessage</p>";
      ..html = '''
        <h1>New Request !</h1>
        <p>I hope this email finds you well. I am writing to share some exciting news with you regarding 
        our ongoing efforts to expand our client base. We have recently received a request from a 
        potential client who has expressed interest in our services, and I am pleased to inform you 
        that they are eager to initiate contact.</p>
        <p></p>
        <p></p>
        <p>Client / Oragnization: $name</p>
        <p>Service: $service</p>
        <p>Required date: $date</p>
        <p>Message from user: $emailmessage</p>
        <p></p>
        <p></p>
        <p>Thank you for your attention.</p>
        <p>Best regards,</p>
        <p>TurnTech Mobile Application.</p>
      ''';
    try{
      await send(message,smp);
      QuickAlert.show(
        type: QuickAlertType.success,
        context: context,
        title: 'Request Sent',
        widget: Text(
          'Our professional team will contact you as soon as possible.',
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
        confirmBtnColor: Color.fromRGBO(46,50,141,1),
      );
      print("SMTP Server: ${smp.host}:${smp.port}");
    }on MailerException catch(e){
      QuickAlert.show(
        type: QuickAlertType.error,
        context: context,
        title: 'Error',
        widget: Text(
          'There is something wrong in your connection.',
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
        confirmBtnColor: Color.fromRGBO(46,50,141,1),
      );
      print(smp);
      print("error : $e");
    }


  }




}