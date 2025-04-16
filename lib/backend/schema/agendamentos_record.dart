import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendamentosRecord extends FirestoreRecord {
  AgendamentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "profissionais" field.
  DocumentReference? _profissionais;
  DocumentReference? get profissionais => _profissionais;
  bool hasProfissionais() => _profissionais != null;

  // "horario" field.
  DateTime? _horario;
  DateTime? get horario => _horario;
  bool hasHorario() => _horario != null;

  void _initializeFields() {
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _profissionais = snapshotData['profissionais'] as DocumentReference?;
    _horario = snapshotData['horario'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Agendamentos');

  static Stream<AgendamentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendamentosRecord.fromSnapshot(s));

  static Future<AgendamentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendamentosRecord.fromSnapshot(s));

  static AgendamentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgendamentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendamentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendamentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendamentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendamentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendamentosRecordData({
  DocumentReference? usuario,
  DocumentReference? profissionais,
  DateTime? horario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario': usuario,
      'profissionais': profissionais,
      'horario': horario,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendamentosRecordDocumentEquality
    implements Equality<AgendamentosRecord> {
  const AgendamentosRecordDocumentEquality();

  @override
  bool equals(AgendamentosRecord? e1, AgendamentosRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.profissionais == e2?.profissionais &&
        e1?.horario == e2?.horario;
  }

  @override
  int hash(AgendamentosRecord? e) =>
      const ListEquality().hash([e?.usuario, e?.profissionais, e?.horario]);

  @override
  bool isValidKey(Object? o) => o is AgendamentosRecord;
}
