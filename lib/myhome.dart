import 'package:flutter/material.dart';
import 'package:fooddeliveryapplication/data/data.dart';
import 'package:fooddeliveryapplication/models/restaurant.dart';
import 'cartscreen.dart';
import 'recentorders.dart';
import 'rating_stars.dart';
import 'package:fooddeliveryapplication/restaurant_screen.dart';
import 'conts.dart';


class Myhome extends StatefulWidget {

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {


  _buildRestaurantlist(){
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => RestaurantScreen(restaurant: restaurant),),
          ),

          child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            children: <Widget>[

              ClipRRect(

                borderRadius: BorderRadius.circular(15.0),

                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage(
                  restaurant.imageUrl
              ),
                  fit: BoxFit.cover,
              ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(restaurant.name ,
                      style: Resturantname
                      ),

                    RatingStars(restaurant.rating),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(restaurant.address ,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('200 Miles Away' ,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,

                    ),

                  ],
                ),
              )

            ],
          ),
      ),
        ),
      );
    });
    return Column(children: restaurantList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: (){

          },
        ),
        title: Center(child: Text('Food Delivery')),

        actions: <Widget>[
          FlatButton(onPressed: (){

            Navigator.push(
              context, MaterialPageRoute(
                builder: (_) =>
                  CartScreen()

            ),
            );

          },
              child:
              Text ('Cart (${currentUser.cart.length})',
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 20.0
                ),
              ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8 ,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: Icon(Icons.search , size: 30.0),
                suffixIcon:
                IconButton(icon: Icon(Icons.clear),
                  onPressed: (){
                    },
              ),
            ),
            ),
          ),
          RecentOrder(),
          SizedBox(
            height: 6.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
               child: Text(
                 'Near By Restaurants' , style: TextStyle(
                 fontSize: 24.0,
                 fontWeight: FontWeight.w600,
                 letterSpacing: 1.2
               ),
               ),
               ),
              SizedBox(
                height: 6.0,
              ),
              _buildRestaurantlist(),
            ],
          ),
        ],
      ),
    );
  }
}

