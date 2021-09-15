import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_riverpod/models/speaker.dart';
import 'package:rating_riverpod/utils/utils.dart';

class DetailsScreen extends StatelessWidget {
  final Speaker speaker;
  final Function(int) ratingChanged;

  DetailsScreen({
    required this.speaker,
    required this.ratingChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speaker Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(speaker.assetName,
                    fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Center(
                    child: Text(speaker.name,
                        style: TextStyle(
                          fontSize: 30.0,
                        )))),
            Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                    child: Text(speaker.topic,
                        style: TextStyle(
                          fontSize: 20.0,
                        )))),
            RatingBar.builder(
                initialRating: speaker.rating?.toDouble() ?? 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) =>
                Utils.getRatingIcon(index + 1) ?? SizedBox.shrink(),
                onRatingUpdate: (rating) => ratingChanged(rating.toInt())),
          ],
        ),
      ),
    );
  }
}
