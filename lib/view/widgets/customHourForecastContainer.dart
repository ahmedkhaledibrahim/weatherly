import 'package:flutter/material.dart';
import 'package:weatherly/models/hourlyForecast.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

Widget customHourForecastContainer(HourlyForecast item, BuildContext context) {
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.2,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 34, 35, 200),
            Color.fromARGB(255, 34, 35, 100),
            Color.fromARGB(255, 34, 35, 81),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
              color: Colors.white70,
              offset: Offset(1, 1),
              spreadRadius: 2,
              blurRadius: 5)
        ]),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${item.dateTime}'.substring(11, 16),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).alternate,
              ),
        ),
        IconPhrase(item.iconPhrase, item.isDayLight),
        Text(
          '${item.temprature.toStringAsFixed(0)}°c',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).alternate,
              ),
        ),
      ],
    ),
  );
}

Image IconPhrase(String iconPhrase, bool isDayLight) {
  switch (iconPhrase) {
    case "Ice":
      return Image.asset("assets/icons/Snow@2x.png");
    case "Sleet":
      return Image.asset("assets/icons/Snowy@2x.png");
    case "Freezing Rain":
      return Image.asset("assets/icons/Snowy@2x.png");
    case "Rain and Snow":
      return Image.asset("assets/icons/Snowy@2x.png");
    case "Hot":
      return Image.asset("assets/icons/Temperature up@2x.png");
    case "Cold":
      return Image.asset("assets/icons/Cold Temperature@2x.png");
    case "Windy":
      return Image.asset("assets/icons/Windy@2x.png");
    default:
  }

  if (isDayLight) {
    switch (iconPhrase) {
      case "Sunny":
        return Image.asset("assets/icons/Sun@2x.png");
      case "Mostly sunny":
        return Image.asset("assets/icons/Sun@2x.png");
      case "Partly sunny":
        return Image.asset("assets/icons/Sun@2x.png");
      case "Intermittent clouds":
        return Image.asset("assets/icons/Cloudy-Sun@2x.png");
      case "Hazy sunshine":
        return Image.asset("assets/icons/Cloudy-Sun@2x.png");
      case "Mostly cloudy":
        return Image.asset("assets/icons/Cloudy-Sun@2x.png");
      case "Cloudy":
        return Image.asset("assets/icons/Cloud@2x.png");
      case "Dreary":
        return Image.asset("assets/icons/Cloudy@2x.png");
      case "Fog":
        return Image.asset("assets/icons/Cloudy 2@2x.png");
      case "Showers":
        return Image.asset("assets/icons/Cloudy 2@2x.png");
      case "Mostly cloudy w/ showers":
        return Image.asset("assets/icons/Rain 2@2x.png");
      case "Partly sunny w/ showers":
        return Image.asset("assets/icons/Rain 2@2x.png");
      case "T-Storms":
        return Image.asset("assets/icons/Thunder cloud@2x.png");
      case "Mostly cloudy w/ T-Storms":
        return Image.asset("assets/icons/Thunder cloud@2x.png");
      case "Partly sunny w/ T-Storms":
        return Image.asset("assets/icons/Thunder cloud@2x.png");
      case "Rain":
        return Image.asset("assets/icons/Rain@2x.png");
      case "Flurries":
        return Image.asset("assets/icons/Snowy@2x.png");
      case "Mostly cloudy w/ flurries":
        return Image.asset("assets/icons/Snowy@2x.png");
      case "Partly sunny w/ flurries":
        return Image.asset("assets/icons/Sun Rain 2@2x.png");
      case "Snow":
        return Image.asset("assets/icons/Snow@2x.png");
      case "Mostly cloudy w/ snow":
        return Image.asset("assets/icons/Snow@2x.png");
    }
  } else if (!isDayLight) {
    switch (iconPhrase) {
      case "Clear":
        return Image.asset("assets/icons/Moon 2@2x.png");
      case "Mostly clear":
        return Image.asset("assets/icons/Moon 2@2x.png");
      case "Partly cloudy":
        return Image.asset("assets/icons/Cloudy-Moon@2x.png");
      case "Intermittent clouds":
        return Image.asset("assets/icons/Cloudy-Moon@2x.png");
      case "Hazy moonlight":
        return Image.asset("assets/icons/Cloudy-Moon@2x.png");
      case "Mostly cloudy":
        return Image.asset("assets/icons/Cloudy-Moon@2x.png");
      case "Intermittent clouds":
        return Image.asset("assets/icons/Cloudy-Moon@2x.png");
      case "Cloudy":
        return Image.asset("assets/icons/Cloud@2x.png");
      case "Dreary":
        return Image.asset("assets/icons/Cloudy@2x.png");
      case "Fog":
        return Image.asset("assets/icons/Cloudy 2@2x.png");
      case "Showers":
        return Image.asset("assets/icons/Cloudy 2@2x.png");
      case "Mostly cloudy w/ showers":
        return Image.asset("assets/icons/Sun Rain 2@2x.png");
      case "Partly cloudy w/ showers":
        return Image.asset("assets/icons/Sun Rain 2@2x.png");
      case "T-Storms":
        return Image.asset("assets/icons/Thunder cloud@2x.png");
      case "Mostly cloudy w/ T-Storms":
        return Image.asset("assets/icons/Thunder cloud@2x.png");
      case "Partly sunny w/ T-Storms":
        return Image.asset("assets/icons/Thunder cloud@2x.png");
      case "Rain":
        return Image.asset("assets/icons/Rain@2x.png");
      case "Mostly cloudy w/ Flurries":
        return Image.asset("assets/icons/Snowy@2x.png");
      case "Partly sunny w/ Flurries":
        return Image.asset("assets/icons/Sun Rain 2@2x.png");
      case "Snow":
        return Image.asset("assets/icons/Snow@2x.png");
      case "Mostly cloudy w/ Snow":
        return Image.asset("assets/icons/Snow@2x.png");
      default:
        return Image.asset("assets/icons/Celcius@2x.png");
    }
  }
  return Image.asset("assets/icons/Celcius@2x.png");
}
