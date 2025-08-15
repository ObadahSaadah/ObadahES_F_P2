import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardTable extends StatelessWidget {
  CardTable({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text21,
    required this.text22,
    required this.text23,
    required this.stars,
  });

  String text1;
  String text2;
  String text3;
  String text4;

  String text21;
  String text22;
  String text23;
  double stars;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0))),
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                text1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text21,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                text2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text22,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                text3,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                text23,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                text4,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              RatingBar.builder(
                initialRating: stars,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 4,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
