import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interface_2/review_screen/star_rating.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double rating = 3.5;

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard() {
    return new Container(
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildSocialBtn(
                          () => print('Login with Facebook'),
                          AssetImage(
                            'images/user.jpg',
                          ),
                        ),
                      ],
                    ),
                  ]),
                  Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                                      StarRating(
                                          rating: rating,
                                          onRatingChanged: (rating) => setState(() => this.rating = rating)
                                      ),
                                      SizedBox(width:10),
                                      Text("01 Jan 2020",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                          )),
                                      SizedBox(width:50),
                                    ]
                                ,
                          ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: new Column(
                                  children: <Widget>[
                                    new Text(
                                      "Item recommended in good condition. I will recommend to other buyer",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )),
                          ])
                    ],
                  ),
                ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.arrow_back),
                                            onPressed: () {},
                                          ),
                                          SizedBox(width:90),
                                          Text(
                                            'Reviews',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width:90)
                                        ]
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Reviews',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width:200)
                                        ]
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          StarRating(
                                              rating: rating,
                                              onRatingChanged: (rating) => setState(() => this.rating = rating)
                                          ),
                                          SizedBox(width:10),
                                          Text(
                                            '8 Reviews',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(width:90)
                                        ]
                                    )

                                  ]
                              ),

                            ]),




                    ),

              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                     _buildReviewCard(),
                      _buildReviewCard(),
                      _buildReviewCard(),
                      _buildReviewCard(),
                      _buildReviewCard(),
                      _buildReviewCard(),
                      _buildReviewCard(),
                      _buildReviewCard()
                    ],
                  ),
                ),
              ),
            )
          ],
        )

    );
  }
}
