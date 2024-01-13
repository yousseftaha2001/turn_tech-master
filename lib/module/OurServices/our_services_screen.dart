import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:turn_tech/Components/our_services_component.dart';
import 'package:turn_tech/module/Home/home_controller.dart';
import 'package:turn_tech/module/Home/home_model.dart';
import 'package:turn_tech/module/OurServices/our_services_model.dart';

class OurServicesScreen extends StatelessWidget {
   OurServicesScreen({Key? key}) : super(key: key);

  List<homeModel> homeList = [
    homeModel(
      title: 'Mobile Application Development',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      image: 'images/mobile-application.png',
      icon: null,
    ),
    homeModel(
      title: 'Web Application Development',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      image: null,
      icon: Icon(IcoFontIcons.web,size: 120.sp,color: Colors.blue),
    ),
    homeModel(
      title: 'Desktop Application',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      image: null,
      icon : Icon(MdiIcons.remoteDesktop,size: 120.sp,color: Colors.green,),
    ),
    homeModel(
      title: 'Software',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      image: 'images/computer.png',
      icon: null,
    ),
    homeModel(
      title: 'Hardware',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      image: 'images/cpu.png',
      icon: null,
    ),
    homeModel(
      title: 'IT Services',
      body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      image: null,
      icon: Icon(Icons.router_outlined,size: 120.sp,color: Colors.red),
    ),
  ];

  List<OurServicesNumbersModel> numbersModel = [
    OurServicesNumbersModel(
        Number: '500',
        Text: 'CUSTOMERS AROUND THE WORLD'
    ),
    OurServicesNumbersModel(
        Number: '20000',
        Text: 'DOWNLOADS OF OUR APPS'
    ),
    OurServicesNumbersModel(
        Number: '100',
        Text: 'COLLABORATORS'
    ),
    OurServicesNumbersModel(
        Number: '8',
        Text: 'OFFICES IN THE EMEA REGION'
    ),
    OurServicesNumbersModel(
        Number: '1000',
        Text: 'PROJECT AND MISSIONS DELIVERED OVER 9 YEARS'
    ),
  ];

  var selectedServiceController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${homeList[selectedServiceController.selectedService].title}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.sp),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                homeList[selectedServiceController.selectedService].icon == null
                    ? Image(height:150.h,width: 150.w, image
                    : AssetImage('${homeList[selectedServiceController.selectedService].image}') ) : homeList[selectedServiceController.selectedService].icon ?? Container(),
                SizedBox(height: 20.h,),
                Text(
                    '${homeList[selectedServiceController.selectedService].body}',
                    maxLines: 100,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                )
            ),
                SizedBox(height: 40.h,),

                Container(
                  height: 500.h,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OurServices(number: numbersModel[index].Number, text: numbersModel[index].Text);
                    },
                    itemCount: 5,
                  ),
                ),
              ]
          ),
        ),
      ),
      )
    );
  }
}
