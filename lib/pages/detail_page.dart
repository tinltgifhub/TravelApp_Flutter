import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars=3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
      DetailState detail=state as DetailState;
      return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: screenHeight*0.43,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+detail.place.img),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            Positioned(
              left: screenWidth*0.01,
              top: screenHeight*0.06,
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      BlocProvider.of<AppCubits>(context).goHome();
                    }, 
                    icon: Icon(Icons.menu),color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight*0.4,
              child: Container(
                padding: EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.06,right: screenWidth*0.06),
                width: screenWidth,
                height: screenHeight*0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(     
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text:detail.place.name,color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text: '\$'+detail.place.price.toString(),color: AppColors.mainColor,),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: AppColors.mainColor,),
                        SizedBox(width: screenWidth*0.01,),
                        AppText(text: detail.place.location,color: AppColors.textColor1,),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index){
                            return Icon(Icons.star,color:index<detail.place.stars? AppColors.starColor:AppColors.textColor2,);
                          }),
                        ),
                        SizedBox(width: screenWidth*0.01,),
                        AppText(text: "(4.0)",color: AppColors.textColor2,)
                      ],
                    ),
                    SizedBox(height: screenHeight*0.03,),
                    AppLargeText(text: "People",color: Colors.black.withOpacity(0.8),size: 20,),
                    SizedBox(height: screenHeight*0.01,),
                    AppText(text: "Number of people in your group",color: AppColors.mainTextColor,),
                    SizedBox(height: screenHeight*0.01,),
                    Wrap(
                      children:List.generate(5, (index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: screenWidth*0.02),
                            child: AppButtons(
                              size: screenHeight*0.07,
                              color: selectedIndex==index?Colors.white:Colors.black,
                              backgroundColor:selectedIndex==index?Color.fromARGB(255, 46, 53, 61) : AppColors.buttonBackground,
                              borderColor: selectedIndex==index?Colors.black : AppColors.buttonBackground,
                              text: (index+1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: screenHeight*0.03,),
                    AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                    SizedBox(height: screenHeight*0.01,),
                    AppText(text: detail.place.description, color: AppColors.mainTextColor,)
                  ],
                ),
              ),
            ),
            
            //2:50
            
            Positioned(
              bottom: screenHeight*0.030,
              left: screenWidth*0.06,
              right: screenWidth*0.06,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1, 
                    backgroundColor: Colors.white, 
                    size: screenHeight*0.07, 
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: screenWidth*0.04,),
                  ResponsiveButton(
                    isResponsive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    });

  }
}