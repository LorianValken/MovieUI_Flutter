import 'package:flutter/material.dart';
import '../colors/constant.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';

class DownloadingView extends StatefulWidget {
   const DownloadingView({super.key});

  @override
  State<DownloadingView> createState() => _DownloadingViewState();
}

class _DownloadingViewState extends State<DownloadingView> {
  var Downloadind  = [
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmdBbXCs85JxxKyG664KI46rdC3.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1RaSkWakWBxxYOWRrqmwo2my5zg.jpg',
  ];
  late List<TabData> tabs;

  @override

  void initState() {
    tabs = [
      TabData(
        index: 1,
        title: const Tab(
          child: Text('Downloading',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        ),
        content: ListView.builder(
           itemCount: Downloadind.length,
           itemBuilder: (context, index) {
             final downloading = Downloadind[index];
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                 height: 140,
                 child: Container(
                   decoration: BoxDecoration(
                     color: kCardColor,
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                   Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         downloading,
                          fit: BoxFit.cover,width: 130,height: 130,)),
                       ),
                         SizedBox(
                           width: 249,
                           height: 130,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   const Text(
                                       "Tranformer: The Last Game",
                                       style: TextStyle(color: Colors.white)
                                   ),
                                   IconButton(
                                       onPressed: () {},
                                       icon: const Icon(Icons.more_vert,color: Colors.white,)),
                                 ],
                               ),
                               const Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text(
                                     "Action Advanceture",
                                     style: TextStyle(color: Colors.grey,),
                                   ),
                                 ],
                               ),
                               const Spacer(),
                               const Text(
                                 "2191 | 12GB",
                                 style: TextStyle(color: Colors.grey),
                               ),
                             ],
                           ),
                         ),
                     ],
                   ),
                 ),
               ),
             );
           },
        ),
      ),
      TabData(
        index: 2,
        title: const Tab(
          child: Text('Downloaded',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        ),
        content: ListView.builder(
          itemCount: Downloadind.length,
          itemBuilder: (context, index) {
            final downloading = Downloadind[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 140,
                child: Container(
                  decoration: BoxDecoration(
                      color: kCardColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              downloading,
                              fit: BoxFit.cover,width: 130,height: 130,)),
                      ),
                      SizedBox(
                        width: 249,
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "Tranformer: The Last Game",
                                    style: TextStyle(color: Colors.white)
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert,color: Colors.white,)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Action Advanceture",
                                  style: TextStyle(color: Colors.grey,),
                                ),
                                Expanded(

                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.timelapse,color: Colors.white,)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "2191 | 12GB",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text("Download",style: TextStyle(color: Colors.white),),
      ),
      body:  Expanded(
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
    );
  }
}
