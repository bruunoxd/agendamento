import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfissionaisRecord extends FirestoreRecord {
  ProfissionaisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome_profissional" field.
  String? _nomeProfissional;
  String get nomeProfissional => _nomeProfissional ?? '';
  bool hasNomeProfissional() => _nomeProfissional != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "profissao" field.
  String? _profissao;
  String get profissao => _profissao ?? '';
  bool hasProfissao() => _profissao != null;

  // "disponivel" field.
  bool? _disponivel;
  bool get disponivel => _disponivel ?? false;
  bool hasDisponivel() => _disponivel != null;

  // "foto_url" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  bool hasFotoUrl() => _fotoUrl != null;

  // "horaAlmoco" field.
  DateTime? _horaAlmoco;
  DateTime? get horaAlmoco => _horaAlmoco;
  bool hasHoraAlmoco() => _horaAlmoco != null;

  void _initializeFields() {
    _nomeProfissional = snapshotData['nome_profissional'] as String?;
    _email = snapshotData['email'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _profissao = snapshotData['profissao'] as String?;
    _disponivel = snapshotData['disponivel'] as bool?;
    _fotoUrl = snapshotData['foto_url'] as String?;
    _horaAlmoco = snapshotData['horaAlmoco'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profissionais');

  static Stream<ProfissionaisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfissionaisRecord.fromSnapshot(s));

  static Future<ProfissionaisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfissionaisRecord.fromSnapshot(s));

  static ProfissionaisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfissionaisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfissionaisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfissionaisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfissionaisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfissionaisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfissionaisRecordData({
  String? nomeProfissional,
  String? email,
  String? telefone,
  String? profissao,
  bool? disponivel,
  String? fotoUrl,
  DateTime? horaAlmoco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_profissional': nomeProfissional,
      'email': email,
      'telefone': telefone,
      'profissao': profissao,
      'disponivel': disponivel,
      'foto_url': fotoUrl,
      'horaAlmoco': horaAlmoco,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfissionaisRecordDocumentEquality
    implements Equality<ProfissionaisRecord> {
  const ProfissionaisRecordDocumentEquality();

  @override
  bool equals(ProfissionaisRecord? e1, ProfissionaisRecord? e2) {
    return e1?.nomeProfissional == e2?.nomeProfissional &&
        e1?.email == e2?.email &&
        e1?.telefone == e2?.telefone &&
        e1?.profissao == e2?.profissao &&
        e1?.disponivel == e2?.disponivel &&
        e1?.fotoUrl == e2?.fotoUrl &&
        e1?.horaAlmoco == e2?.horaAlmoco;
  }

  @override
  int hash(ProfissionaisRecord? e) => const ListEquality().hash([
        e?.nomeProfissional,
        e?.email,
        e?.telefone,
        e?.profissao,
        e?.disponivel,
        e?.fotoUrl,
        e?.horaAlmoco
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfissionaisRecord;
}
