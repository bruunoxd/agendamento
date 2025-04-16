import '/flutter_flow/flutter_flow_util.dart';
import 'pag_profissoes_widget.dart' show PagProfissoesWidget;
import 'package:flutter/material.dart';

class PagProfissoesModel extends FlutterFlowModel<PagProfissoesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtProfissao widget.
  FocusNode? txtProfissaoFocusNode;
  TextEditingController? txtProfissaoTextController;
  String? Function(BuildContext, String?)? txtProfissaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtProfissaoFocusNode?.dispose();
    txtProfissaoTextController?.dispose();
  }
}
