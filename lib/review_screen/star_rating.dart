import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Colors.yellow,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Colors.yellow,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 0.5),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}