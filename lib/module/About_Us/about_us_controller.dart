import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsController extends GetxController {

  Future<void> CallCustomerService() async {
    var url = Uri.parse("tel:01000086986");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  openWhatsAppChat(String phoneNumber) async {
    String url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  openFacebookProfile(String username) async {
    String url = 'https://www.facebook.com/$username';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  openWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }



}