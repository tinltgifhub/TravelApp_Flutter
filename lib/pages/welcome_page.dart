import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    'welcome-one.jpg',
    'welcome-two.png',
    'welcome-three.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_,index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/'+images[index]
                ),
                fit: BoxFit.cover,
              )
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: screenHeight*0.14,
                left: screenWidth*0.07,
                right: screenWidth*0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text:'Trips'),
                      AppText(text: 'Montains',size: 30,),
                      SizedBox(height: screenHeight*0.03,),
                      Container(
                        width: screenWidth*0.6,
                        child: AppText(
                          text: 'Mountain hikes give you an incredible sense of freedom along with endurance test',
                          color: AppColors.textColor2,
                          size: 14,
                        )
                      ),
                      SizedBox(height: screenHeight*0.02,),
                      ResponsiveButton(width: screenWidth*0.25,),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 4),
                        width: screenWidth*0.02,
                        height: index==indexDots?screenHeight*0.035:screenHeight*0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.mainColor,
                        ),
                      );
                    }),
                  ),
                ]),
            ),
          );
        },
      ),
    );
  }
}