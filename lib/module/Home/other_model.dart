import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherWidget extends StatelessWidget {
   OtherWidget({Key? key , required this.text , required this.number}) : super(key: key);

   late String text;
   late String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${number}'),
          SizedBox(height: 20.h,),
          Text('${text}'),
        ],
      ),
    );
  }
}
