import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/view/widgets/customHourForecastContainer.dart';

import '../../bloc/hourly_forecast_cubit.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: double.infinity,
      decoration:  BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 211, 218, 240),
            Color.fromARGB(255, 93, 110, 155),
            Color.fromARGB(255, 34, 35, 81),
          ],
        ),
        border: Border.all(
            width: 2,
            color: Colors.white70
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        // Optional: Adds rounded corners
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'Hourly Forecast',
              style: FlutterFlowTheme
                  .of(context)
                  .bodyMedium
                  .override(
                  fontFamily: 'Readex Pro',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          BlocBuilder<HourlyForecastCubit, HourlyForecastState>(
            builder: (context, state) {
              if (state is HourlyForecastLoaded) {
                return SizedBox(
                  width: double.infinity,
                  height: MediaQuery
                      .sizeOf(context)
                      .height * 0.2,
                  child: ListView.builder(
                    itemCount:state.hourlyForecastList.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        customHourForecastContainer(state.hourlyForecastList[index], context),

                  ),
                );
              }
              else if (state is HourlyForecastLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),);
              }
              else if (state is HourlyForecastFailed) {
                return Center(child: Text(state.errorMessage));
              }
              return const Center(child: Text("Undefined Error"));
            },
          ),
        ],
      ),
    );
  }
}
