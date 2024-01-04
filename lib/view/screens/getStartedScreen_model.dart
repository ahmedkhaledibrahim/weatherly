import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'getStarted_screen.dart' show GetStartedScreenWidget;
import 'package:flutter/material.dart';


class GetStartedScreenModel extends FlutterFlowModel<GetStartedScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
