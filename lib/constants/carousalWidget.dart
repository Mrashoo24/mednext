import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class AutoCarouselWithIndicator extends StatefulWidget {
  final List<Map<String,dynamic>> imgList ;
  const AutoCarouselWithIndicator({super.key,required this.imgList});

  @override
  _AutoCarouselWithIndicatorState createState() =>
      _AutoCarouselWithIndicatorState();
}

class _AutoCarouselWithIndicatorState extends State<AutoCarouselWithIndicator> {
  int _currentIndex = 0; // Track the current banner index

  // List of image paths for the carousel

  @override
  Widget build(BuildContext context) {

    final List<Map<String,dynamic>> imgList = widget.imgList;


    return Column(
      children: [
        if(imgList.isNotEmpty) CarouselSlider.builder(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 1,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update current index when page changes
              });
            },
          ),itemCount: imgList.length, itemBuilder: (BuildContext context, int index, int realIndex) {

            var image  = imgList[index]["title"];
            var imageLink  = imgList[index]["link"];

            return Builder(
              builder: (BuildContext context) {
                return Container(

                  // margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      image.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
        },
        ),
        SizedBox(height: 16.0),
       if(imgList.isNotEmpty) DotsIndicator(
          dotsCount: imgList.length, // Number of dots equal to the number of images
          position: _currentIndex.toInt(), // Current active dot
          decorator: DotsDecorator(
            activeColor: Colors.black, // Color for active dot
            size: const Size.square(12.0),
            activeSize: const Size.fromRadius(6.0),
            // activeShape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
          ),
        ),
      ],
    );
  }
}
