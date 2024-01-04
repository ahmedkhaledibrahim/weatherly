import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:weatherly/models/forecast.dart';

import 'customHourForecastContainer.dart';

Widget CustomDayTemprature(
    String iconPhrase, String temp, bool isDayLight, BuildContext context) {
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.45,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(34, 35, 81, 0.7),
      border: Border.all(width: 2, color: Colors.white70),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconPhrase(iconPhrase, isDayLight),
          Text(
            iconPhrase,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: const Color(0xFFAEB2E0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            '$temp°c',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 24,
                ),
          ),
        ],
      ),
    ),
  );
}
