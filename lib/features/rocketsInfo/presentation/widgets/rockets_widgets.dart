import 'package:flutter/material.dart';
import 'package:rockets_spacex/stringConstant.dart';

Widget flickerImage(
    {required double height,
    required double width,
    required List<String> flickerImages,
    required EdgeInsetsGeometry margin}) {
  return Container(
    height: height,
    child: ListView.builder(
        itemCount: flickerImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return Container(
              height: height,
              width: width,
              margin: margin,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(flickerImages[i]),
                      fit: BoxFit.cover)));
        }),
  );
}

Widget errorWidget(Function() onPressed) {
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(StringConstant.kSomethingWentWrong),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(StringConstant.retry),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                primary: Colors.deepOrangeAccent,
                maximumSize: Size(100.0, 40.0)),
          ),
        ],
      ),
    ),
  );
}
