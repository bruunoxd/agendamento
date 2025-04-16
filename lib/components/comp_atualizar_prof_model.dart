import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'comp_atualizar_prof_widget.dart' show CompAtualizarProfWidget;
import 'package:flutter/material.dart';

class CompAtualizarProfModel extends FlutterFlowModel<CompAtualizarProfWidget> {
  ///  Local state fields for this component.

  String? novaFoto;

  DateTime? varHorarioAlmoco;

  ///  State fields for stateful widgets in this component.

  // State field(s) for txtNomeProf widget.
  FocusNode? txtNomeProfFocusNode;
  TextEditingController? txtNomeProfTextController;
  String? Function(BuildContext, String?)? txtNomeProfTextControllerValidator;
  // State field(s) for dpProfissao widget.
  String? dpProfissaoValue;
  FormFieldController<String>? dpProfissaoValueController;
  DateTime? datePicked;
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
