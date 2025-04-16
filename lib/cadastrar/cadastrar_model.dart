import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastrar_widget.dart' show CadastrarWidget;
import 'package:flutter/material.dart';

class CadastrarModel extends FlutterFlowModel<CadastrarWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  // State field(s) for txtConfSenha widget.
  FocusNode? txtConfSenhaFocusNode;
  TextEditingController? txtConfSenhaTextController;
  late bool txtConfSenhaVisibility;
  String? Function(BuildContext, String?)? txtConfSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
    txtConfSenhaVisibility = false;
  }

  @override
  void dispose() {
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtConfSenhaFocusNode?.dispose();
    txtConfSenhaTextController?.dispose();
  }
}
