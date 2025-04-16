import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'agendamento_widget.dart' show AgendamentoWidget;
import 'package:flutter/material.dart';

class AgendamentoModel extends FlutterFlowModel<AgendamentoWidget> {
  ///  Local state fields for this page.

  List<DateTime> listaHoras = [];
  void addToListaHoras(DateTime item) => listaHoras.add(item);
  void removeFromListaHoras(DateTime item) => listaHoras.remove(item);
  void removeAtIndexFromListaHoras(int index) => listaHoras.removeAt(index);
  void insertAtIndexInListaHoras(int index, DateTime item) =>
      listaHoras.insert(index, item);
  void updateListaHorasAtIndex(int index, Function(DateTime) updateFn) =>
      listaHoras[index] = updateFn(listaHoras[index]);

  DateTime? horaSelecionada;

  List<DateTime> horasReservadas = [];
  void addToHorasReservadas(DateTime item) => horasReservadas.add(item);
  void removeFromHorasReservadas(DateTime item) => horasReservadas.remove(item);
  void removeAtIndexFromHorasReservadas(int index) =>
      horasReservadas.removeAt(index);
  void insertAtIndexInHorasReservadas(int index, DateTime item) =>
      horasReservadas.insert(index, item);
  void updateHorasReservadasAtIndex(int index, Function(DateTime) updateFn) =>
      horasReservadas[index] = updateFn(horasReservadas[index]);

  bool? indisponivel = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in agendamento widget.
  List<AgendamentosRecord>? outHorarios;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  List<AgendamentosRecord>? outHoras;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
