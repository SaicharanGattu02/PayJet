import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool onclick = false;
  String profile_image = "";
  String name = "";
  bool _loading = true;
  int currentIndex = 0;

  final List<String> imgList = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
  ];

  final List<Map<String, String>> items = [
    {'image': 'assets/mobilerecharge.png', 'text': 'Mobile Recharge'},
    {'image': 'assets/cardpayment.png', 'text': 'Card Payment'},
    {'image': 'assets/moneytransfer.png', 'text': 'Money Transfer'},
    {'image': 'assets/aadharpay.png', 'text': 'Aadhar Pay'},
    {'image': 'assets/paymentgateway.png', 'text': 'Payment Gateway'},
    {'image': 'assets/mobilerecharge.png', 'text': 'Post Paid'},
    {'image': 'assets/Insurance.png', 'text': 'Insurance'},
    {'image': 'assets/viewmore.png', 'text': 'View More'},
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _refreshData() async {
    setState(() {
      _loading = true;
    });
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String nameInitial =
        (name.trim().isNotEmpty) ? name.trim()[0].toUpperCase() : "";

    return Scaffold(
      backgroundColor: Color(0xffFF7A2F),
      appBar: AppBar(



        backgroundColor: Color(0xffFF7A2F),
        toolbarHeight: height * 0.1,
        title: Row(
          children: [
            Image.asset(
              'assets/profile.png',
              fit: BoxFit.contain,
              height: 52,
              width: 52, // Adjust the height as needed
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Add Address",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
                Text(
                  "The Platina",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        color: Color(0xFFF6821F),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 3,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  viewportFraction: 1,
                  pauseAutoPlayOnTouch: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: imgList.map((item) {
                  return InkWell(
                    onTap: () async {
                      // Your onTap functionality here
                    },
                    child: Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            item,
                            fit: BoxFit.contain,
                            height: 112,
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  bool isActive = currentIndex == entry.key;
                  return Container(
                    width: isActive ? 17.0 : 7.0,
                    height: 7.0,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? Color(0xFF000000) : Color(0xFFffffff),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: height * 0.025),
              Container(
                padding: EdgeInsets.all(20),
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.1),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    // Adjusted to ensure it fits the container
                    SizedBox(
                      height: 200, // Set a fixed height to the GridView
                      child: GridView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Disable scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Column(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                child: Image.asset(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 2),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  item['text']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(children: [
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Color(0xff7209B7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 6.6,
                                      right: 6.6,
                                      top: 5.4,
                                      bottom: 5.4),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(1000)),
                                  child: Image.asset("assets/train.png"),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bus Ticket",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          fontFamily: "Inter"),
                                    ),
                                    Text(
                                      "Booking",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          fontFamily: "Inter"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 6,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Color(0xffF72585),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 6.6,
                                      right: 6.6,
                                      top: 5.4,
                                      bottom: 5.4),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(1000)),
                                  child: Image.asset("assets/train.png"),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Flight Ticket",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          fontFamily: "Inter"),
                                    ),
                                    Text(
                                      "Booking",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          fontFamily: "Inter"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 6,),
                      // Row(
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.all(11),
                      //       decoration: BoxDecoration(
                      //         color: Color(0xff3A0CA3),
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           Container(
                      //             padding: EdgeInsets.only(
                      //                 left: 6.6,
                      //                 right: 6.6,
                      //                 top: 5.4,
                      //                 bottom: 5.4),
                      //             width: 24,
                      //             height: 24,
                      //             decoration: BoxDecoration(
                      //                 color: Color(0xffffffff),
                      //                 borderRadius: BorderRadius.circular(1000)),
                      //             child: Image.asset("assets/train.png"),
                      //           ),
                      //           SizedBox(
                      //             width: 8,
                      //           ),
                      //           Column(mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Whole sale",
                      //                 style: TextStyle(
                      //                     color: Color(0xffFFFFFF),
                      //                     fontWeight: FontWeight.w700,
                      //                     fontSize: 11,
                      //                     fontFamily: "Inter"),
                      //               ),
                      //               Text(
                      //                 "Booking",
                      //                 style: TextStyle(
                      //                     color: Color(0xffFFFFFF),
                      //                     fontWeight: FontWeight.w700,
                      //                     fontSize: 11,
                      //                     fontFamily: "Inter"),
                      //               )
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),

                    ],),

                    SizedBox(height: 10),
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bill Payments',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Inter",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
