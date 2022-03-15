import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

//
//Color _getColorFromHex(String hexColor) {
//  hexColor = hexColor.replaceAll("#", "");
//  if (hexColor.length == 6) {
//    hexColor = "FF" + hexColor;
//  }
//  if (hexColor.length == 8) {
//    return Color(int.parse("0x$hexColor"));
//  }
//  return Color(0xff0000ff);
//}
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  final pages = List.generate(
      5,
          (index) => Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/best.png",
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "از کجا برنامه نویسی رو شروع کنم؟",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: 'Vazir',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange, // background
                          ),
                          child: Text(
                            'توضیح بده',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: 'Vazir',
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )));

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 0.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: Column(
                    children: [
                      searchTab(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        // color: _getColorFromHex('#E0E5EC'),
                        height: 130,
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: PageView.builder(
                            controller: controller,
                            itemBuilder: (_, index) {
                              return pages[index % pages.length];
                            },
                          ),
                        ),
                        //decoration: BoxDecoration(color: Colors.transparent),
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: pages.length,
                        effect: WormEffect(
                          dotHeight: 5,
                          dotWidth: 5,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 292,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  "همه",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: 'Vazir',
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "دسته بندی",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: 'Vazir',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: double.infinity,
                            height: 90,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: 90,
                                  child: Card(
                                    color: Colors.lightGreen[200],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    elevation: 2,
                                    margin:
                                    EdgeInsets.only(right: 5, bottom: 2),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          right: 5,
                                          left: 5,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Image.asset(name),
                                          Image.asset(
                                            'assets/images/language.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          Text(
                                            'زبان انگلیسی',
                                            textDirection: TextDirection.rtl,
                                            style:
                                            TextStyle(fontFamily: 'Vazir'),
                                          ),
                                          Text(
                                            '۲۹ کلاس',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontFamily: 'Vazir',
                                                fontSize: 7,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  child: Card(
                                    color: Colors.red[200],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    elevation: 2,
                                    margin:
                                    EdgeInsets.only(right: 5, bottom: 2),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          right: 5,
                                          left: 5,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Image.asset(name),
                                          Image.asset(
                                            'assets/images/programming.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          Text(
                                            'برنامه نویسی',
                                            textDirection: TextDirection.rtl,
                                            style:
                                            TextStyle(fontFamily: 'Vazir'),
                                          ),
                                          Text(
                                            '۱۲ کلاس',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontFamily: 'Vazir',
                                                fontSize: 7,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  child: Card(
                                    color: Colors.pink[200],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    elevation: 2,
                                    margin:
                                    EdgeInsets.only(right: 5, bottom: 2),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          right: 5,
                                          left: 5,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Image.asset(name),
                                          Image.asset(
                                            'assets/images/motiv.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          Text(
                                            'انگیزشی',
                                            textDirection: TextDirection.rtl,
                                            style:
                                            TextStyle(fontFamily: 'Vazir'),
                                          ),
                                          Text(
                                            '۷۸ کلاس',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontFamily: 'Vazir',
                                                fontSize: 7,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  child: Card(
                                    color: Colors.orange[200],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    elevation: 2,
                                    margin:
                                    EdgeInsets.only(right: 5, bottom: 2),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          right: 5,
                                          left: 5,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          //Image.asset(name),
                                          Image.asset(
                                            'assets/images/germany.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                          Text(
                                            'زبان آلمانی',
                                            textDirection: TextDirection.rtl,
                                            style:
                                            TextStyle(fontFamily: 'Vazir'),
                                          ),
                                          Text(
                                            '۱۷ کلاس',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontFamily: 'Vazir',
                                                fontSize: 7,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  "ادامه",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: 'Vazir',
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "بهترین ها",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: 'Vazir',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

//                      const Icon(
//                        Icons.filter_list,
//                        size: 30,
//                        color:  Colors.blue
//                      )
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 1),
                            decoration:
                            BoxDecoration(color: Colors.transparent),
                            height: 200,
                            width: double.infinity,
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                lesson_card('برنامه نویسی #C', 'رضا رزم ارا',
                                    'assets/images/chemistry.png'),
                                lesson_card('زبان انگلیسی', 'حمید رضایی',
                                    'assets/images/learning_language.png'),
                                lesson_card('سفر به لندن', 'احمد رضایی',
                                    'assets/images/travel.png'),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'مدرسه من',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget lesson_card(String name, String desc, String image_addr) {
  return Container(
    width: 300,
    child: Card(
      color: Colors.purple[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -5,
            left: 10,
            child: Image.asset(
              image_addr,
              height: 160,
              width: 160,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      name,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontFamily: 'Vazir',
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            " با $desc",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontFamily: 'Vazir',
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 15.0,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            'assets/images/avatar.jpg',
                                            height: 30,
                                            width: 30,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 9,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                          ),
                          Text(
                            "۲ساعت",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: 'Vazir',
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.library_books,
                            size: 20,
                          ),
                          Text(
                            "۱۷ جلسه",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontFamily: 'Vazir', fontSize: 10),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                          ),
                          Text(
                            "۲۳ امتیاز",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontFamily: 'Vazir', fontSize: 10),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.comment,
                            size: 20,
                          ),
                          Text(
                            "۱۹ نظر",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontFamily: 'Vazir', fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget searchTab() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    // use whichever suits your need
    children: <Widget>[
      Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
              padding: EdgeInsets.all(7),
              child: Icon(Icons.search, color: Colors.black))),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: CircleAvatar(
              radius: 20.0,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  height: 50,
                  width: 50,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ],
      )
    ],
  );
}