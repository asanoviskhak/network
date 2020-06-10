import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:network/weather_forecast/model/weather_forecast_model.dart';
import 'package:network/weather_forecast/model/weather_forecast_model2.dart';

import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel2> snapshot, BuildContext context){
  var forecastList = snapshot.data.forecast.forecastday;
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
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 10,),
          itemCount: 3,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            width: MediaQuery.of(context).size.width/2.3,
            height: 200,
            child: forecastCard(snapshot, index),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black45,
                      Colors.black87,
                      Colors.black,
                    ],
                    stops: [
                      0.1,
                      0.9,
                      1
                    ]
                )
            ),
          ),
        ),
      ),
      ),
    ],
  );
}