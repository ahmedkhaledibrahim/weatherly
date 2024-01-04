import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';


Widget customButton(Function onpressed,BuildContext context){
  return Padding(
    padding:
    const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
    child: FFButtonWidget(
      onPressed: (){
        onpressed();
      },
      text: '12-Hour Forecast',
      options: FFButtonOptions(
        height: 40,
        padding: const EdgeInsetsDirectional.fromSTEB(
            24, 0, 24, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(
            0, 0, 0, 0),
        color: const Color(0x157A6DD8),
        textStyle: FlutterFlowTheme.of(context)
            .titleSmall
            .override(
          fontFamily: 'Readex Pro',
          color: Colors.white,
        ),
        elevation: 1,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context)
              .secondaryBackground,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}