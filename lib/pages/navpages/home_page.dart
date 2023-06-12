
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var image={
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    TabController _tabController=TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: EdgeInsets.only(top: screenHeight*0.04,left: screenWidth*0.03),
            child: Row(
              children: [
                Icon(Icons.menu,size: 30,color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: screenWidth*0.03),
                  width: screenWidth*0.1,
                  height: screenHeight*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ]
            ),
          ),
          SizedBox(height: screenHeight*0.04,),
          Container(
            margin: EdgeInsets.only(left: screenWidth*0.03),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: screenHeight*0.01,),

          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                labelPadding:  EdgeInsets.only(left: screenWidth*0.05,right: screenWidth*0.05),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicatro(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: screenWidth*0.03),
            height: screenHeight*0.43,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index ){
                    return Container(
                      margin: EdgeInsets.only(right: screenWidth*0.03, top: screenHeight*0.02),
                      width: screenWidth*0.5,
                      // height: screenHeight*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            "images/mountain.jpg"
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },

                ),
                Text("There"),
                Text("Bye"),
              ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth*0.03,vertical: screenHeight*0.03),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore for more",size: 22,),
                AppText(text: "See all",color: AppColors.textColor1,)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
            height: screenHeight*0.12,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
                return  Container(
                  margin: EdgeInsets.only(right: screenWidth*0.08),
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth*0.14,
                        height: screenHeight*0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:AssetImage(
                              'images/'+image.keys.elementAt(index),
                            ), 
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight*0.01,),
                      Container(
                        child: AppText(
                          text: image.values.elementAt(index),
                          color: AppColors.textColor2,
                        ),
                      ),
                    ],
                  ),
                );
            }),
          ),
        ]
      ),
    );
  }
}

class CircleTabIndicatro extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicatro({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circuleOffset=Offset(configuration.size!.width/2-radius/2,configuration.size!.height-radius);
    canvas.drawCircle(offset+circuleOffset, radius, _paint);
  }
}