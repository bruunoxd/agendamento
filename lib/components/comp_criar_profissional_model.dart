import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'comp_criar_profissional_widget.dart' show CompCriarProfissionalWidget;
import 'package:flutter/material.dart';

class CompCriarProfissionalModel
    extends FlutterFlowModel<CompCriarProfissionalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtNomeProf widget.
  FocusNode? txtNomeProfFocusNode;
  TextEditingController? txtNomeProfTextController;
  String? Function(BuildContext, String?)? txtNomeProfTextControllerValidator;
  // State field(s) for dpProfissao widget.
  String? dpProfissaoValue;
  FormFieldController<String>? dpProfissaoValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for swDisponivel widget.
  bool? swDisponivelValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNomeProfFocusNode?.dispose();
    txtNomeProfTextController?.dispose();
  }
}
