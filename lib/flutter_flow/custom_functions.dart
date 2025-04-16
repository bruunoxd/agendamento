import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime>? gerarListaHoras(DateTime? dataRef) {
  if (dataRef == null) {
    return null;
  }

  List<DateTime> listaHoras = [];

  DateTime horaAtual = DateTime(dataRef.year, dataRef.month, dataRef.day, 8);

  while (horaAtual.hour <= 21) {
    listaHoras.add(horaAtual);
    horaAtual = horaAtual.add(Duration(hours: 1));
  }

  return listaHoras;
}
