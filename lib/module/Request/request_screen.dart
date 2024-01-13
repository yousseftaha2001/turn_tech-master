import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickalert/quickalert.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:turn_tech/module/Request/request_controller.dart';

class RequestScreen extends StatefulWidget {


  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  @override
  void initState() {
    // TODO: implement initState
    requestController.today.value = DateTime.now().add(Duration(days: 1));
    super.initState();
  }

  TextEditingController servicesController = new TextEditingController();
  var nameController =  TextEditingController();
  var messageController =  TextEditingController();
  var requestController = Get.put(RequestController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top:20.sp, right: 20.sp , left: 20.sp , bottom: 30.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Our Services',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  // color:  Color.fromRGBO(46,50,141,1),
                  color:  Colors.black,
                ),
              ),
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.h),
                    child: TextField(
                      readOnly: true,
                      controller: servicesController,
                      decoration: InputDecoration(
                        hintText: 'Select One...',
                          border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                requestController.displayServicesList = !requestController.displayServicesList;
                              });
                            },
                            child: requestController.displayServicesList ?
                            Icon(MdiIcons.chevronUp,color: Colors.black,size:30.sp,)
                                :Icon(MdiIcons.chevronDown,color: Colors.black,size:30.sp,))
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              requestController.displayServicesList?
              Container(
                width: double.infinity,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        servicesController.text = requestController.servicesList[index];
                        setState(() {
                          requestController.displayServicesList = !requestController.displayServicesList;
                        });
                      },
                        child: ListTile(
                          title: Text(
                              '${requestController.servicesList[index]}'
                          ),
                        ),
                    );
                  },
                  itemCount: requestController.servicesList.length,
                ),
              ):SizedBox(),
              SizedBox(height: 30.h,),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color:  Colors.black,
                ),
              ),
              SizedBox(height: 5.h,),
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.h),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Organization\'s Name',
                          border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              InkWell(
                onTap: (){
                  setState(() {
                    requestController.displayCalendar = !requestController.displayCalendar;
                  });
                },
                child: Container(
                  width: 200.h,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(46,50,141,1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.h),
                      child: Row(
                        children: [
                          Icon(MdiIcons.calendarMonthOutline,size: 25.sp,color: Colors.white,),
                          SizedBox(width: 10.w,),
                          Center(
                              child: Text(
                                  requestController.displayCalendar?'Done ':'Show Calendar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              requestController.displayCalendar?
                  Column(
                    children: [
                      Obx(
                        () {
                          return TableCalendar(
                            focusedDay: requestController.today.value,
                            rowHeight: 30.h,
                            firstDay: DateTime.utc(2023,1,1),
                            lastDay:  DateTime.utc(2030,12,31),
                            availableGestures: AvailableGestures.all,
                            selectedDayPredicate: (day) => isSameDay(day,requestController.today.value),
                            onDaySelected: (selectedDay, focusedDay) {
                              requestController.onDaySelected(selectedDay,focusedDay);
                            },
                            headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true
                            ),

                          );
                        },

                      ),
                      SizedBox(height: 10.h,),

                    ],
                  ) :SizedBox(),
              SizedBox(height: 15.h,),
              Obx(
                () {
                  return Text(
                    'Date : ${requestController.today.value.toString().split(' ')[0]}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h,),
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.h),
                  child: TextFormField(
                    controller: messageController,
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              InkWell(
                onTap: ()async{
                  if(servicesController.text.isNotEmpty && nameController.text.isNotEmpty && messageController.text.isNotEmpty){
                    await requestController.sendEmail(service: servicesController.text , name: nameController.text , date: '${requestController.today.value.toString().split(' ')[0]}' , emailmessage: messageController.text , context: context);
                    servicesController.clear();
                    nameController.clear();
                    requestController.today.value =  DateTime.now().add(Duration(days: 1));
                    messageController.clear();
                  }else{
                    QuickAlert.show(
                      type: QuickAlertType.warning,
                      context: context,
                      title: 'Warning',
                      widget: Text(
                        'Please, fill all the fields.',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                      ),
                      confirmBtnColor: Color.fromRGBO(46,50,141,1),
                    );
                  }
                  print('sent');
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(46,50,141,1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.h),
                      child: Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
