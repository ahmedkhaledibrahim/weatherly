import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weatherly/bloc/location_cubit.dart';
import '../../bloc/curr_condition_cubit.dart';
import '../../bloc/forecast_cubit.dart';
import '../../bloc/hourly_forecast_cubit.dart';
import 'forecastDetails_screen.dart';
import 'getStartedScreen_model.dart';
export 'getStartedScreen_model.dart';

class GetStartedScreenWidget extends StatefulWidget {
  const GetStartedScreenWidget({Key? key}) : super(key: key);

  @override
  _GetStartedScreenWidgetState createState() => _GetStartedScreenWidgetState();
}

class _GetStartedScreenWidgetState extends State<GetStartedScreenWidget>
    with TickerProviderStateMixin {
  late GetStartedScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetStartedScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Weathely',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(65, 50, 65, 20),
                child: BlocListener<LocationCubit, LocationState>(
                  listener: (context, state) {
                    if (state is LocationLoaded) {
                      BlocProvider.of<ForecastCubit>(context)
                          .getForecastByLocationKey(state.location.key);
                      BlocProvider.of<CurrConditionCubit>(context)
                          .getCurrentCondition(state.location.key);
                      BlocProvider.of<HourlyForecastCubit>(context)
                          .getHourlyForecast(state.location.key);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ForecastDetailsScreenWidget(),
                      ));
                    }
                  },
                  child: FFButtonWidget(
                    showLoadingIndicator: true,
                    onPressed: () async {
                      final ipv4 = await Ipify.ipv4();
                      BlocProvider.of<LocationCubit>(context)
                          .getDeviceLocationByIP(ipv4);
                    },
                    text: 'Get Your Location Forecast',
                    options: FFButtonOptions(
                      height: 40,
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: const Color(0x157A6DD8),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 1,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
