import 'package:flutter/material.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';

import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){
  var forecastList = snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("24 Hours forecast".toUpperCase(),
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[600]
      ),
      ),
      Container(
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 2),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 8,),
          itemCount: 8,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            width: MediaQuery.of(context).size.width/2.3,
            height: 160,
            child: forecastCard(snapshot, index),
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [Color(0xff535353), Color(0xff000000)],
                radius: 2.5,
              ),
            ),
          ),
        ),
      ),
      ),
    ],
  );
}