import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/view/widgets/customButton.dart';
import 'package:weatherly/view/widgets/customDayTemprature.dart';
import 'package:weatherly/view/widgets/customSearchBar.dart';
import '../../bloc/curr_condition_cubit.dart';
import '../../bloc/forecast_cubit.dart';
import '../../bloc/location_cubit.dart';
import '../widgets/customModalBottomsheet.dart';
export 'forecastDetailsScreen_model.dart';

class ForecastDetailsScreenWidget extends StatefulWidget {
  const ForecastDetailsScreenWidget({Key? key}) : super(key: key);

  @override
  _ForecastDetailsScreenWidgetState createState() =>
      _ForecastDetailsScreenWidgetState();
}

class _ForecastDetailsScreenWidgetState
    extends State<ForecastDetailsScreenWidget> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchCityController = TextEditingController();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.7,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(60, 0),
          end: const Offset(0, 0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                const CustomSearchBar(),
                BlocBuilder<ForecastCubit, ForecastState>(
                  builder: (context, state) {
                    if (state is ForecastLoaded) {
                      return Column(
                        children: [
                          BlocBuilder<LocationCubit, LocationState>(
                            builder: (context, state) {
                              if (state is LocationLoaded) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 120, 0, 0),
                                  child: Text(
                                    state.location.localizedName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                );
                              } else if (state is LocationLoadFailed) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 120, 0, 0),
                                  child: Text(
                                    "Not Found",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                          Center(
                            child: BlocBuilder<CurrConditionCubit,
                                CurrConditionState>(
                              builder: (context, state) {
                                if (state is CurrConditionLoaded) {
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 0, 0),
                                    child: Text(
                                      "${state.currCondition.temprature}°c",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 45,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 0, 0),
                                    child: Text(
                                      "Not Available",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w200,
                                          ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 20, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomDayTemprature(state.forecast.dayPhrase,
                                    state.forecast.maximum, true, context),
                                CustomDayTemprature(state.forecast.nightPhrase,
                                    state.forecast.minimum, false, context),
                              ],
                            ),
                          ),
                          customButton(() {
                            showBottomSheet(
                              backgroundColor: Colors.transparent,
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.sizeOf(context).width,
                              ),
                              context: context,
                              builder: (context) =>
                                  const CustomModalBottomSheet(),
                            );
                          }, context)
                        ],
                      );
                    } else if (state is ForecastLoadFailed) {
                      return const Center(
                        child: Text("Failed To Load Forecast"),
                      );
                    } else if(state is ForecastLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
