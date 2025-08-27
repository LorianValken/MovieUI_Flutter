import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/colors/constant.dart';
import 'package:movie_app/screens/downloading_view.dart';

class MovieDetailView extends StatefulWidget {
  final String imageURL;
   const MovieDetailView({super.key,required this.imageURL});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  late List<TabData> tabs;
  @override
  void initState() {
    tabs = [
    TabData(
      index: 1,
      title: const Tab(
        child: Text('Episode',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kCardColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(child: Image.network(widget.imageURL,fit: BoxFit.cover,width: 120,))),
              ),
              const Column(
                children: [
                   SizedBox(
                     width: 235,
                     child: Padding(
                       padding: EdgeInsets.symmetric(vertical: 15),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Trailer",
                               style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                           Icon(Icons.download_outlined,color: Colors.white,),
                         ],
                       ),
                     ),
                   ),
                  SizedBox(
                    width: 235,
                    child: Text('''A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary...ReadMore''',style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    TabData(
      index: 2,
      title: const Tab(
        child: Text('Similiar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kCardColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.imageURL,fit: BoxFit.cover,width: 120,)),
              ),
              const Column(
                children: [
                  SizedBox(
                    width: 235,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Trailer",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                          Icon(Icons.download_outlined,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 235,
                    child: Text('''A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary...ReadMore''',style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    // Add more tabs as needed
    TabData(
      index: 2,
      title: const Tab(
        child: Text('About',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kCardColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.imageURL,fit: BoxFit.cover,width: 120,)),
              ),
              const Column(
                children: [
                  SizedBox(
                    width: 235,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Trailer",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                          Icon(Icons.download_outlined,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 235,
                    child: Text('''A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary...ReadMore''',style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    // Add more tabs as needed
  ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
           Stack(
              children: [
                ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height,));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(widget.imageURL,height: 300,fit: BoxFit.cover, width: double.infinity,)),
                //Row Button Bar
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.bookmark_outline,color: Colors.white,)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.share,color: Colors.white,)),
                        ),

                      ],
                    ),
                  ),
                )
              ],
             //Row Button Bar
           ),
           const Text("Disney's Aladdin", style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold),
           ),
          const Text("2019 - Advanture Comedy - 2h 8n ",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                 Expanded(
                   child: SizedBox(
                     height: 50,
                     child: ElevatedButton(
                       style: ButtonStyle(
                         backgroundColor: WidgetStateProperty.all(kButtonColor),
                         foregroundColor: WidgetStateProperty.all(Colors.white70),
                       ),
                         onPressed: (){},
                         child: const Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.play_arrow),
                             SizedBox(width: 5,),
                             Text("Play"),
                           ],
                         ),
                     ),
                   ),
                 ),
                  const SizedBox(width: 20,),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.all(kCardColor),
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DownloadingView(),));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.download),
                              SizedBox(width: 5,),
                              Text("Download"),
                            ],
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('''A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary Deadpool, behind him...ReadMore''',style: TextStyle(color: Colors.white),),
          ),
          Expanded(
            child: DynamicTabBarWidget(
              dividerHeight: 0,
              dynamicTabs: tabs,
              onTabControllerUpdated: (controller) {
                debugPrint("onTabControllerUpdated");
              },
              onTabChanged: (index) {
                debugPrint("Tab changed: $index");
              },
              onAddTabMoveTo: MoveToTab.last,
            ),
          ),
        ],
      ),
    );
  }
}
