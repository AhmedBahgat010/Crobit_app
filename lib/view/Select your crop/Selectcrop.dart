import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Diseases/details.dart';
import 'package:flutter/material.dart';

import '../../core/style/my_colors.dart';

class SelectYourCrop extends StatefulWidget {
  const SelectYourCrop({Key? key}) : super(key: key);

  @override
  State<SelectYourCrop> createState() => _SelectYourCropState();
}

class _SelectYourCropState extends State<SelectYourCrop> {

  bool select =false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Select your crop",
            style: TextStyle(color: AppColor.black, fontSize: 30)),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:    Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
          child:select==false ? Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: AppColor.greenDark),
              borderRadius: BorderRadius.circular(15), //<-- SEE HERE
            ),
            child: Center(
                child:Text("Save",style: hintStyle.apply(color: AppColor.greenDark),)
            ),
          ):InkWell(
            onTap: (){
              // navigateTo(context, DetailsScreen());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color:AppColor.greenDark,
                border: Border.all(width: 3, color: AppColor.greenDark),
                borderRadius: BorderRadius.circular(15), //<-- SEE HERE
              ),
              child: Center(
                  child:Text("Save",style: hintStyle.apply(color: AppColor.white),)
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
        child: SingleChildScrollView(
            child: Container(
          child: InkWell(
            onTap: () {
              setState(() {
                select=!select;
              });

              print(select);
            },
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: select==false?AppColor.white:AppColor.green,
                    border: Border.all(width: 1, color:select==false?AppColor.greenDark:AppColor.green),
                    borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/images/img_11.png',
                    ),
                  ),
                ),
                Text("Wheat",style: mediumStyle,),


              ],
            ),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 50,),
        onPressed: () {},
      ),

    );
  }
}
