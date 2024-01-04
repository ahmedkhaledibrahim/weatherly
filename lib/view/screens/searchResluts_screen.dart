import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherly/bloc/forecast_cubit.dart';
import 'package:weatherly/bloc/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/view/screens/forecastDetails_screen.dart';

import '../../bloc/curr_condition_cubit.dart';
import '../../bloc/hourly_forecast_cubit.dart';
import '../../bloc/location_cubit.dart';
import '../../models/city.dart';

class SearchResultsWidget extends StatefulWidget {
  final List<City> searchList;
  final String searchWord;

  const SearchResultsWidget(
      {required this.searchList, required this.searchWord});

  @override
  _SearchResultsWidgetState createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 66),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/weatherly_bg.jpg',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Results of ${widget.searchWord}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation']!),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoaded) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const ScrollPhysics(),
                          //<--here
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: widget.searchList.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () async {
                              BlocProvider.of<LocationCubit>(context)
                                  .getLocationDetails(
                                      widget.searchList[index].cityKey,
                                      widget.searchList[index].name,
                                      widget.searchList[index].country);
                              await BlocProvider.of<ForecastCubit>(context)
                                  .getForecastByLocationKey(
                                      widget.searchList[index].cityKey);
                              BlocProvider.of<CurrConditionCubit>(context)
                                  .getCurrentCondition(
                                      widget.searchList[index].cityKey);
                              BlocProvider.of<HourlyForecastCubit>(context)
                                  .getHourlyForecast(
                                      widget.searchList[index].cityKey);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForecastDetailsScreenWidget(),
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Container(
                                width: 100,
                                height: 83,
                                decoration: BoxDecoration(
                                  color: const Color(0x6D41488F),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: const Color(0xFF4B39EF),
                                    width: 3,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${widget.searchList[index].name}, ',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        widget.searchList[index].country,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (state is SearchEmpty) {
                        return const Center(
                          child: Text('Not Found'),
                        );
                      } else if (state is SearchLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchFailed) {
                        return const Center(
                          child: Text('Failed to load'),
                        );
                      }
                      return const Center(
                        child: Text('Loading!!'),
                      );
                    },
                  ),
                ).animateOnPageLoad(
                    animationsMap['listViewOnPageLoadAnimation']!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
