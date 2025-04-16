import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'agendamento_model.dart';
export 'agendamento_model.dart';

class AgendamentoWidget extends StatefulWidget {
  const AgendamentoWidget({
    super.key,
    required this.pmtProfissional,
  });

  final ProfissionaisRecord? pmtProfissional;

  static String routeName = 'agendamento';
  static String routePath = '/agendamento';

  @override
  State<AgendamentoWidget> createState() => _AgendamentoWidgetState();
}

class _AgendamentoWidgetState extends State<AgendamentoWidget> {
  late AgendamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendamentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listaHoras = functions
          .gerarListaHoras(getCurrentTimestamp)!
          .toList()
          .cast<DateTime>();
      safeSetState(() {});
      // Consulta Banco
      _model.outHorarios = await queryAgendamentosRecordOnce(
        queryBuilder: (agendamentosRecord) => agendamentosRecord
            .where(
              'horario',
              isGreaterThanOrEqualTo: _model.calendarSelectedDay?.start,
            )
            .where(
              'profissionais',
              isEqualTo: widget.pmtProfissional?.reference,
            ),
        limit: 14,
      );
      _model.horasReservadas = _model.outHorarios!
          .map((e) => e.horario)
          .withoutNulls
          .toList()
          .toList()
          .cast<DateTime>();
      safeSetState(() {});
      _model.horaSelecionada = _model.calendarSelectedDay?.start;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 30.0, 0.0),
                              child: Text(
                                'Agendamentos',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.network(
                                    valueOrDefault<String>(
                                      widget.pmtProfissional?.fotoUrl,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/agendamento-pdcu6o/assets/5hxt0ob2zai1/png-transparent-computer-icons-user-profile-others-miscellaneous-face-monochrome.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: valueOrDefault<String>(
                                    widget.pmtProfissional?.fotoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/agendamento-pdcu6o/assets/5hxt0ob2zai1/png-transparent-computer-icons-user-profile-others-miscellaneous-face-monochrome.png',
                                  ),
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: valueOrDefault<String>(
                              widget.pmtProfissional?.fotoUrl,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/agendamento-pdcu6o/assets/5hxt0ob2zai1/png-transparent-computer-icons-user-profile-others-miscellaneous-face-monochrome.png',
                            ),
                            transitionOnUserGestures: true,
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  widget.pmtProfissional?.fotoUrl,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/agendamento-pdcu6o/assets/5hxt0ob2zai1/png-transparent-computer-icons-user-profile-others-miscellaneous-face-monochrome.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.pmtProfissional?.nomeProfissional,
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.pmtProfissional?.profissao,
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 4.0))
                                  .around(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlutterFlowCalendar(
                    color: FlutterFlowTheme.of(context).primaryText,
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    weekFormat: true,
                    weekStartsMonday: false,
                    initialDate: getCurrentTimestamp,
                    rowHeight: 64.0,
                    onChange: (DateTimeRange? newSelectedDate) async {
                      if (_model.calendarSelectedDay == newSelectedDate) {
                        return;
                      }
                      _model.calendarSelectedDay = newSelectedDate;
                      _model.listaHoras = functions
                          .gerarListaHoras(_model.calendarSelectedDay?.start)!
                          .toList()
                          .cast<DateTime>();
                      safeSetState(() {});
                      // Consulta Banco
                      _model.outHoras = await queryAgendamentosRecordOnce(
                        queryBuilder: (agendamentosRecord) => agendamentosRecord
                            .where(
                              'horario',
                              isGreaterThanOrEqualTo:
                                  _model.calendarSelectedDay?.start,
                            )
                            .where(
                              'profissionais',
                              isEqualTo: widget.pmtProfissional?.reference,
                            ),
                        limit: 15,
                      );
                      _model.horasReservadas = _model.outHoras!
                          .map((e) => e.horario)
                          .withoutNulls
                          .toList()
                          .cast<DateTime>();
                      safeSetState(() {});
                      _model.horaSelecionada =
                          _model.calendarSelectedDay?.start;
                      safeSetState(() {});
                      safeSetState(() {});
                    },
                    titleStyle:
                        FlutterFlowTheme.of(context).headlineSmall.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                    dayOfWeekStyle:
                        FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    selectedDateStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    inactiveDateStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  Container(
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Selecione um horario disponivel abaixo:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height:
                          ((MediaQuery.sizeOf(context).width - 40) / 5) * 3 + 4,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final itensGridView = _model.listaHoras.toList();

                          return GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              2.0,
                              0,
                              2.0,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: itensGridView.length,
                            itemBuilder: (context, itensGridViewIndex) {
                              final itensGridViewItem =
                                  itensGridView[itensGridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.listaHoras = functions
                                      .gerarListaHoras(
                                          _model.calendarSelectedDay?.start)!
                                      .toList()
                                      .cast<DateTime>();
                                  safeSetState(() {});
                                  _model.horaSelecionada = itensGridViewItem;
                                  _model.indisponivel = _model.horasReservadas
                                          .contains(itensGridViewItem) ||
                                      (getCurrentTimestamp >=
                                          itensGridViewItem) ||
                                      (dateTimeFormat(
                                            "Hm",
                                            widget.pmtProfissional?.horaAlmoco,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ) ==
                                          dateTimeFormat(
                                            "Hm",
                                            itensGridViewItem,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ));
                                  safeSetState(() {});
                                  _model.horasReservadas = _model.outHoras!
                                      .map((e) => e.horario)
                                      .withoutNulls
                                      .toList()
                                      .cast<DateTime>();
                                  safeSetState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: _model.horasReservadas.contains(
                                                  itensGridViewItem) ||
                                              (getCurrentTimestamp >=
                                                  itensGridViewItem) ||
                                              (dateTimeFormat(
                                                    "Hm",
                                                    widget.pmtProfissional
                                                        ?.horaAlmoco,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ) ==
                                                  dateTimeFormat(
                                                    "Hm",
                                                    itensGridViewItem,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: itensGridViewItem ==
                                                _model.horaSelecionada
                                            ? Color(0xFF3E0101)
                                            : Color(0x00000000),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          dateTimeFormat(
                                            "Hm",
                                            itensGridViewItem,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.calendar_month,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            _model.indisponivel!
                                ? 'Selecione um horário disponivel'
                                : 'Agendar para ${dateTimeFormat(
                                    "MMMMEEEEd",
                                    _model.horaSelecionada,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )} às ${dateTimeFormat(
                                    "Hm",
                                    _model.horaSelecionada,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 4.0))
                          .around(SizedBox(width: 4.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: _model.indisponivel!
                            ? null
                            : () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('INFORMAÇÃO'),
                                          content: Text(
                                              'Deseja agendar com ${widget.pmtProfissional?.nomeProfissional}, às ${dateTimeFormat(
                                            "Hm",
                                            _model.horaSelecionada,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('NÃO'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('SIM'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  await AgendamentosRecord.collection
                                      .doc()
                                      .set(createAgendamentosRecordData(
                                        usuario: currentUserReference,
                                        profissionais:
                                            widget.pmtProfissional?.reference,
                                        horario: _model.horaSelecionada,
                                      ));
                                } else {
                                  return;
                                }

                                context.pushNamed(
                                  MeusAgendamentosWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 700),
                                    ),
                                  },
                                );
                              },
                        text: 'AGENDAR',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
