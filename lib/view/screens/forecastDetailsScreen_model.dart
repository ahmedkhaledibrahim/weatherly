import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'forecastDetails_screen.dart' show ForecastDetailsScreenWidget;
import 'package:flutter/material.dart';

class ForecastDetailsScreenModel
    extends FlutterFlowModel<ForecastDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
