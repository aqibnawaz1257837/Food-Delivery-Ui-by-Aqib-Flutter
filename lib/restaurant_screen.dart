import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';
import 'package:fooddeliveryapplication/rating_stars.dart';
import 'conts.dart';
import 'models/food.dart';

class RestaurantScreen extends StatefulWidget {


  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {


  _buldMenuItems(Food menuItems){
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                menuItems.imageUrl),
                  fit: BoxFit.cover
            ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),

          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),

          Positioned(
            bottom: 65.0,
            child: Column(
              children: <Widget>[
                Text(menuItems.name , style: Namep,),
                Text(
                  '\$${menuItems.price}',
                  style: price,
                ),


              ],
            ),
          ),

          Positioned(
            bottom: 10.0,
            right: 10.0,
            child:  Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                    Icons.add
                ),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: (){

                },
              ),
            ),
          )


        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(
                     Icons.arrow_back_ios,
                    ),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: (){
                      Navigator.pop(context);
                    }),

                    IconButton(icon: Icon(
                        Icons.favorite,

                    ),
                        color: Theme.of(context).primaryColor,
                        iconSize: 35.0,
                        onPressed: (){
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.restaurant.name , style: Resturantname,),
                    Text('200 Miles Away' , style: Resturantaddress,),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(
                  height: 6.0,
                ),
                Text(widget.restaurant.address , style: Resturantaddress,),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                  child: Text('Reviews' , style:  buttontextColors),
                  onPressed: (){}
              ),

              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                  child: Text('Contact' , style:  buttontextColors),
                  onPressed: (){}
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Center(
              child: Text('Menu' , style: Resturantname,),
          ),  SizedBox(
            height: 6.0,
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
            padding: EdgeInsets.all(10.0),
              children: List.generate(widget.restaurant.menu.length, (index)
              {
               Food food =  widget.restaurant.menu[index];
               return _buldMenuItems(food);
              }),
            ),
          ),

        ],
      ),
    );
  }
}
