import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfissoesRecord extends FirestoreRecord {
  ProfissoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome_profissao" field.
  String? _nomeProfissao;
  String get nomeProfissao => _nomeProfissao ?? '';
  bool hasNomeProfissao() => _nomeProfissao != null;

  void _initializeFields() {
    _nomeProfissao = snapshotData['nome_profissao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profissoes');

  static Stream<ProfissoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfissoesRecord.fromSnapshot(s));

  static Future<ProfissoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfissoesRecord.fromSnapshot(s));

  static ProfissoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfissoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfissoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfissoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfissoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfissoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfissoesRecordData({
  String? nomeProfissao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_profissao': nomeProfissao,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfissoesRecordDocumentEquality implements Equality<ProfissoesRecord> {
  const ProfissoesRecordDocumentEquality();

  @override
  bool equals(ProfissoesRecord? e1, ProfissoesRecord? e2) {
    return e1?.nomeProfissao == e2?.nomeProfissao;
  }

  @override
  int hash(ProfissoesRecord? e) =>
      const ListEquality().hash([e?.nomeProfissao]);

  @override
  bool isValidKey(Object? o) => o is ProfissoesRecord;
}
